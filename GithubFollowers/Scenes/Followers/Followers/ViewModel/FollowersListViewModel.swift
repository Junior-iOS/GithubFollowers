//
//  FollowersListViewModel.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import Foundation

protocol FollowersViewModelProtocol: AnyObject {
    func showAlert(for error: String)
    func updateData()
}
 
final class FollowersListViewModel {
    let service = NetworkManager.shared
    weak var delegate: FollowersViewModelProtocol?
    
    public var userName: String
    var followers: [Follower] = []
    
    init(userName: String) {
        self.userName = userName
    }
    
    func loadFollowers(for username: String, page: Int) {
        service.getFollowers(by: username, page: 1) { [weak self] result in
            switch result {
            case .success(let followers):
                self?.followers = followers
                self?.delegate?.updateData()
            case .failure(let errorMessage):
                self?.delegate?.showAlert(for: errorMessage.rawValue)
            }
        }
    }
}
