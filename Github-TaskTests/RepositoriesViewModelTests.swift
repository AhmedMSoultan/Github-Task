//
//  RepositoriesViewModelTests.swift
//  Github-TaskTests
//
//  Created by Ahmed Soultan on 15/04/2022.
//

import XCTest
@testable import Github_Task

class RepositoriesViewModelTests: XCTestCase {
    
    var sut: RepositoriesViewModel!
    var githubServiceMock: GithubServiceMock!
    
    override func setUp() {
        super.setUp()
        githubServiceMock = GithubServiceMock()
        sut = RepositoriesViewModel()
    }
    
    override func tearDown() {
        githubServiceMock = nil
        sut = nil
        
        super.tearDown()
    }
    
    func testFetchingData (){
        sut.fetchRepositoriesDataFromGithubService(apiService: githubServiceMock)
    }

}
