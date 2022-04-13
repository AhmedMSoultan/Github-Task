//
//  GithubService.swift
//  Github-Task
//
//  Created by Ahmed Soultan on 11/04/2022.
//

import Foundation

class GithubService {
    // Connection to the Github-API Service
        
        func requestPageRepositories( pageID : String , completionHandler: @escaping ([Repository] , Error?) -> Void){
            let _ = URLSession.shared.dataTask(with: EndPoint.repositoriesPageEndPoint(pageID).url) { data, response, error in
                guard let data = data else {
                    completionHandler([], error)
                    return
                }
                let decoder = JSONDecoder()
                do{
                    let responseData = try decoder.decode(ResponseData.self, from: data)
                    
                    if let repositories = responseData.repositories {
                        print(repositories)
                        completionHandler(repositories, nil)
                    }
                }catch{
                    print(error)
                }
            }.resume()
        }
}
