//
//  FollowersListViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    private let viewModel: FollowersListViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        viewModel.loadFollowers(for: viewModel.userName, page: 1)
    }
    
    init(username: String) {
        self.viewModel = FollowersListViewModel(userName: username)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func setup() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = viewModel.userName
        viewModel.delegate = self
    }
}

extension FollowersListViewController: FollowersViewModelProtocol {
    func showAlert(for error: String) {
        presentAlert(title: "Ops!", message: error, buttonTitle: "Ok")
    }
}
