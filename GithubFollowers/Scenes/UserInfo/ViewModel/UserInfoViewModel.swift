//
//  UserInfoViewModel.swift
//  GithubFollowers
//
//  Created by NJ Development on 21/02/24.
//

import Foundation

final class UserInfoViewModel {
    let service = NetworkManager.shared
    public let follower: Follower
    
    init(follower: Follower) {
        self.follower = follower
    }
    
    func loadUser() {
        service.fetchData(for: User.self, by: follower.login, with: .user) { [weak self] result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
}
