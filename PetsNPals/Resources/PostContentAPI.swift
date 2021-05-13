//
//  PostAPIContent.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-05-13.
//

import Foundation

//
//  HomeContentAPI.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-05-12.
//

import Foundation

final class PostContentAPI {
    
    // MARK: - make the api class available to the application
    static let shared = PostContentAPI()
    
    // MARK: - The function of retrieving data
    func fetchUserList(onCompletion: @escaping ([Post]) ->()){
        let urlString = "http://noladolo.pythonanywhere.com/"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, resp, error) in
            guard let data = data else {
                print("data was nil")
                return
            }
            guard let postList = try? JSONDecoder().decode(PostList.self, from: data) else {
                print("Couldn't decode json")
                return
            }
            onCompletion(postList.post)
        }
        task.resume()
    }
}



