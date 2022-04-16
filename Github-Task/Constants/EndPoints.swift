//
//  EndPoints.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 11/04/2022.
//

import Foundation

let baseURL = "https://api.github.com/search/repositories?per_page=100&q=created:%3E2017-10-22&sort=stars&order=desc&page="
let secondaryURL = "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc&page="


enum EndPoint {
    
    case repositoriesPageEndPoint(String)
    
    var url: URL {
        return URL(string: self.stringValue)!
    }
    
    var stringValue: String {
        
        switch self {
        
        case .repositoriesPageEndPoint(let pageNumber):
            return baseURL + "\(pageNumber)"
        }
    }
    
}





