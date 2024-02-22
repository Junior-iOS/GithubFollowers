//
//  User.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarName: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlURL: String
    let following: Int
    let followers: Int
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarName = "avatar_url"
        case name
        case location
        case bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case htmlURL = "html_url"
        case following
        case followers
        case createdAt = "created_at"
    }
}
