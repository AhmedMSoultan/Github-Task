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
    
    var pageID = "2"
    
    override init() {
        super.init()
        self.fetchRepositoriesDataFromGithubService()
    }
    
    
    func fetchRepositoriesDataFromGithubService () {
        
        githubService.requestPageRepositories(pageID: pageID) { repositories, error in
            
            if let error = error {
                let message = error.localizedDescription
                self.errorMessage = message
            }else{
                self.arrayOfRepositories = repositories
            }
        }
    }
    
}



