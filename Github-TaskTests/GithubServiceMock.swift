//
//  GithubServiceMock.swift
//  Github-TaskTests
//
//  Created by Ahmed Soultan on 15/04/2022.
//

import Foundation

@testable import Github_Task

class GithubServiceMock: GithubService{
    
    var requestPageRepositoriesIsCalled = false
    var repositories: [Repository] = [Repository]()
    var completionClosure: (([Repository] , Error?) -> Void)!
    
    override func requestPageRepositories(url : URL,  completionHandler: @escaping ([Repository] , Error?) -> Void){
        requestPageRepositoriesIsCalled = true
        completionClosure = completionHandler
    }
}
