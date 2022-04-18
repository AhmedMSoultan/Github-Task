//
//  Repo.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 11/04/2022.
//

import Foundation


class ResponseData: Codable {
    let totalCount : Int?
    let incompleteResult : Bool?
    let repositories : [Repository]?
    
    enum CodingKeys: String , CodingKey {
        
        case totalCount = "total_count"
        case incompleteResult = "incomplete_results"
        case repositories = "items"
    }
}

class Repository: Codable {
    
    let repoID: Int?
    let repoName: String?
    let repoDescription: String?
    let starsCount: Int?
    let issuesCount: Int?
    let lastUpdateDate: String?
    let owner: Owner?
    let html_url: URL?
    
    enum CodingKeys: String , CodingKey {
        case repoID = "id"
        case repoName = "name"
        case repoDescription = "description"
        case starsCount = "stargazers_count"
        case issuesCount = "open_issues_count"
        case lastUpdateDate = "updated_at"
        case owner = "owner"
        case html_url = "html_url"
    }
}

class Owner: Codable {
    let userID: Int?
    let userName: String?
    let userAvatar: URL?
    
    enum CodingKeys: String , CodingKey {
        case userID = "id"
        case userName = "login"
        case userAvatar = "avatar_url"
    }
}

