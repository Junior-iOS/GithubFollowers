//
//  FollowersListViewModel.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import Foundation

protocol FollowersViewModelProtocol: AnyObject {
    func showAlert(for error: String)
}
 
final class FollowersListViewModel {
    public var userName: String
    let service = NetworkManager.shared
    
    weak var delegate: FollowersViewModelProtocol?
    
    init(userName: String) {
        self.userName = userName
    }
    
    func loadFollowers(for username: String, page: Int) {
        service.getFollowers(by: username, page: 1) { result in
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let errorMessage):
                self.delegate?.showAlert(for: errorMessage.rawValue)
            }
        }
    }
}
