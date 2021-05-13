//
//  PostAPIModel.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-05-13.
//

import Foundation

//
//  PostModel.swift
//  PetsNPals
//
//  Created by Isaiah Sylvester on 2021-05-13.
//

import Foundation

// MARK: - The structure of the data expected from API
struct PostList: Codable {
    let post: [Post]
}

struct Post: Codable {
    let title: String?
    let date: String?
    let paragraph: String?
    let img: String?
}
