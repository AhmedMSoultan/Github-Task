//
//  HomePageViewController.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 12/04/2022.
//

import UIKit

class HomePageViewController: UIViewController {

    @IBOutlet weak var repositoriesTableView: UITableView!
    
    var repositiriesViewModel = RepositoriesViewModel()
    
    var arrayOfRepositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Github Repositories"
        
        repositoriesTableView.delegate = self
        repositoriesTableView.dataSource = self
        
        repositiriesViewModel.bindRepositoriesData = {
            self.onSuccessUpdateView()
        }
        repositiriesViewModel.bindErrorMessage = {
            self.onFailUpdateView()
        }
        
    }
    
    func onSuccessUpdateView() {
        self.arrayOfRepositories = repositiriesViewModel.arrayOfRepositories
        DispatchQueue.main.async {
            self.repositoriesTableView.reloadData()
        }
    }
    
    func onFailUpdateView() {
        let alert = UIAlertController(title: "Failed to load data", message: repositiriesViewModel.errorMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    

}

extension HomePageViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryCell", for: indexPath) as! RepositoriesTableViewCell
        cell.repositoryNameLabel.text = arrayOfRepositories[indexPath.row].repoName!
        return cell
    }
    
    
    
}
