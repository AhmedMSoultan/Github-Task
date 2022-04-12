//
//  Repo.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 11/04/2022.
//

import Foundation


struct ResponseData: Codable {
    let totalCount : Int?
    let incompleteResult : Bool?
    let repositories : [Repository]?
    
    enum codingKeys: String , CodingKey {
        
        case totalCount = "total_count"
        case incompleteResult = "incomplete_results"
        case repositories = "items"
    }
}

struct Repository: Codable {
    
    let repoID: Int?
    let repoName: String?
    let repoDescription: String?
    let starsCount: Int?
    let issuesCount: Int?
    let creationDate: Date?
    let lastUpdateDate: Date?
    let pushDate: Date?
//    let owner: Owner?
    
    enum codingKeys: String , CodingKey {
        case repoID = "id"
        case repoName = "name"
        case repoDescription = "description"
        case starsCount = "stargazers_count"
        case issuesCount = "open_issues_count"
        case creationDate = "created_at"
        case lastUpdateDate = "updated_at"
        case pushDate = "pushed_at"
//        case owner = "owner"
    }
}

struct Owner: Codable {
    let userID: Int?
    let userName: String?
    let userAvatar: URL?
    
    enum codingKeys: String , CodingKey {
        case userID = "id"
        case userName = "login"
        case userAvatar = "avatar_url"
    }
}



// MARK: - RepositoryResponse
struct RepositoryResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repositor]
}

// MARK: - Repository
struct Repositor: Codable {
    let id: Int
    let name: String
    let description: String?
    let stargazersCount: Int
    let openIssuesCount: Int
    let createdAt, updatedAt: Date
}

// MARK: - Owner
struct Ownerr: Codable {
    let login: String
    let id: Int
    let avatarURL: String
   

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
}
