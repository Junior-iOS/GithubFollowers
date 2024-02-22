//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 21/02/24.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private let viewModel: UserInfoViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.loadUser()
    }
    
    init(follower: Follower) {
        viewModel = UserInfoViewModel(follower: follower)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func setup() {
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func didTapDone() {
        print("didTapDone")
    }
}
