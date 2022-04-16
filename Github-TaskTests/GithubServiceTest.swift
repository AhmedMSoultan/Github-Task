//
//  GithubServiceTest.swift
//  Github-TaskTests
//
//  Created by Ahmed Soultan on 15/04/2022.
//

import XCTest
@testable import Github_Task

class GithubServiceTest: XCTestCase {
    
    //SUT: System Under Test
    var sut: GithubService!
    
    override func setUp() {
        super.setUp()
        sut = GithubService()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testRequestPageRepositories (){
        
        let promise = XCTestExpectation(description: "Fetch Data Completed")
        var responseData : [Repository]?
        var responseError : Error?
        
        guard let bundle = Bundle.unitTest.path(forResource: "stub", ofType: "json") else {
            XCTFail("Error: content not found")
            return
        }
        
        sut.requestPageRepositories(url: URL(fileURLWithPath: bundle)) { repos, error in
            responseData = repos
            responseError = error
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        
        XCTAssertNil(responseError)
        XCTAssertNotNil(responseData)
    }

}
