//
//  UserInfoViewModel.swift
//  GithubFollowers
//
//  Created by NJ Development on 21/02/24.
//

import Foundation

protocol UserInfoViewModelProtocol: AnyObject {
    func handleSuccess(with user: User)
}

final class UserInfoViewModel {
    let service = NetworkManager.shared
    public let follower: Follower
    
    weak var delegate: UserInfoViewModelProtocol?
    
    init(follower: Follower) {
        self.follower = follower
    }
    
    func loadUser() {
        service.fetchData(for: User.self, by: follower.login, with: .user) { [weak self] result in
            switch result {
            case .success(let user):
                self?.delegate?.handleSuccess(with: user)
                print(user)
            case .failure(let errorMessage):
                print(errorMessage)
            }
        }
    }
}
