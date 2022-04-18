//
//  RepositoriesViewModel.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 12/04/2022.
//

import Foundation

class RepositoriesViewModel: NSObject {
    
    var githubService = GithubService()
    
    var arrayOfRepositories: [Repository] = []{
        didSet{
            self.bindRepositoriesData()
        }
    }
    
    var errorMessage: String = ""{
        didSet{
            self.bindErrorMessage()
        }
    }
    
    var bindRepositoriesData: (()->()) = {}
    var bindErrorMessage: (()->()) = {}
    
    var pageID = 1
    var isFetching = false
    
    override init() {
        super.init()
        self.fetchRepositoriesDataFromGithubService(apiService: githubService)
    }
    
    
    func fetchRepositoriesDataFromGithubService (apiService: GithubService) {
        
        self.isFetching = true
        
        if pageID < 11 {
            apiService.requestPageRepositories(url: EndPoint.repositoriesPageEndPoint("\(pageID)").url) { repositories, error in
                if let error = error {
                    let message = error.localizedDescription
                    self.errorMessage = message
                    }else{
                        self.arrayOfRepositories.append(contentsOf: repositories)
                        self.isFetching = false
                        }
                }
        }
    }
}
