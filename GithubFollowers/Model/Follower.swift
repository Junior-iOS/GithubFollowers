//
//  Follower.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import Foundation

struct Follower: Codable {
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
