//
//  HomePageViewController.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 12/04/2022.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var repositoriesTableView: UITableView!
    @IBOutlet weak var backBlurView: UIVisualEffectView!
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    var repositiriesViewModel = RepositoriesViewModel()
    
    var arrayOfRepositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Github Repositories"
        
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
        repositoriesTableView.prefetchDataSource = self
        
        repositiriesViewModel.bindRepositoriesData = {
            self.onSuccessUpdateView()
        }
        repositiriesViewModel.bindErrorMessage = {
            self.onFailUpdateView()
        }
        
        backBlurView.layer.cornerRadius = 30
        backBlurView.layer.masksToBounds = true
        backBlurView.layer.cornerCurve = .continuous
        
        repositoriesTableView.layer.cornerRadius = 30
        repositoriesTableView.layer.masksToBounds = true
        repositoriesTableView.layer.cornerCurve = .continuous
        
        self.startActivityIndicator()
        
    }
    
    func startActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.color = UIColor(named: "TextColor")
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
            activityIndicator.stopAnimating()
    }
    
    func onSuccessUpdateView() {
        
        self.arrayOfRepositories = repositiriesViewModel.arrayOfRepositories
        DispatchQueue.main.async {
            self.repositoriesTableView.reloadData()
            self.stopActivityIndicator()
        }
        self.repositiriesViewModel.pageID += 1
    }
    
    func onFailUpdateView() {
        let alert = UIAlertController(title: "Failed to load data", message: repositiriesViewModel.errorMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

extension HomePageViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as! RepositoriesTableViewCell
        let repo = arrayOfRepositories[indexPath.row]
        
        cell.setupCell(repoName: repo.repoName ?? "",
                       repoDesc: repo.repoDescription ?? "",
                       repoStars: repo.starsCount ?? 0,
                       repoIssues: repo.issuesCount ?? 0,
                       repoLastUpdateDate: repo.lastUpdateDate ?? "",
                       repoOwnerName: repo.owner?.userName ?? "",
                       ownerAvatar: (repo.owner?.userAvatar ?? URL(string: ""))!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let repo = arrayOfRepositories[indexPath.row]
        let fullURL = repo.html_url
        if let url = fullURL{
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.4) {
            cell.transform = CGAffineTransform.identity
        }
    }
    
}

extension HomePageViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for index in indexPaths {
            if index.row >= arrayOfRepositories.count - 10 && !repositiriesViewModel.isFetching {
                self.repositiriesViewModel.fetchRepositoriesDataFromGithubService(apiService: repositiriesViewModel.githubService)
                break
            }
        }
    }
    
}
