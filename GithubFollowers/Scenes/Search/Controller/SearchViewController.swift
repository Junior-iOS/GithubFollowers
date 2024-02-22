//
//  SearchViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 02/02/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchView = SearchView()
    private let viewModel = SearchViewModel()
    private var hasEnteredUserName: Bool { !searchView.usernameTextField.text!.isEmpty }
    
    override func loadView() {
        super.loadView()
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        
        searchView.usernameTextField.delegate = self
        searchView.actionButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
    }
    
    @objc private func pushFollowersListVC() {
        guard hasEnteredUserName, let username = searchView.usernameTextField.text else {
            presentAlert(title: "Empty username", message: "Please enter username!", buttonTitle: "Ok")
            return
        }
        
        let followersListVC = FollowersListViewController(username: username)
        navigationController?.pushViewController(followersListVC, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: UITextField Delegate
extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
