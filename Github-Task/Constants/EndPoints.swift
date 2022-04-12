//
//  EndPoints.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 11/04/2022.
//

import Foundation

//struct URLs{
//
//    public static var getAPIServiceURL : String = "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc&page="
//
//}

let baseURL = "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc&page="

enum EndPoint {
    
    case repositoriesPageEndPoint(String)
    
    var url: URL {
        return URL(string: self.stringValue)!
    }
    
    var stringValue: String {
        
        switch self {
        
        case .repositoriesPageEndPoint(let pageNumber):
            return baseURL+"\(pageNumber)"
        }
    }
    
}





