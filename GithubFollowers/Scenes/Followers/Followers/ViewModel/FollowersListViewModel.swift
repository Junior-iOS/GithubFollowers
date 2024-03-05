//
//  FollowersListViewModel.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import Foundation

protocol FollowersViewModelProtocol: AnyObject {
    func showAlert(for error: String)
    func showEmptyState(message: String)
    func updateData(on followers: [Follower])
}
 
final class FollowersListViewModel {
    let service = NetworkManager.shared
    weak var delegate: FollowersViewModelProtocol?
    
    public var userName: String
    var followers: [Follower] = []
    var filteredFollowers: [Follower] = []
    var hasMoreFollowers = true
    var page = 1
    
    init(userName: String) {
        self.userName = userName
    }
    
    func loadFollowers(by username: String, page: Int) {
        service.fetchData(for: [Follower].self, by: username, with: .followers, per: page) { [weak self] result in
            switch result {
            case .success(let followers):
                if followers.count < 50 { self?.hasMoreFollowers = false }
                self?.followers.append(contentsOf: followers)
                
                if followers.isEmpty {
                    let message = "This user doesn't have any followers. Go follow them! 😎"
                    DispatchQueue.main.async {
                        self?.delegate?.showEmptyState(message: message)
                        return
                    }
                }
                
                self?.delegate?.updateData(on: self?.followers ?? [])
            case .failure(let errorMessage):
                self?.delegate?.showAlert(for: errorMessage.rawValue)
            }
        }
    }
}
