//
//  UserInfoViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 21/02/24.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    private let viewModel: UserInfoViewModel
    private let headerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.loadUser()
        layoutView()
    }
    
    init(follower: Follower) {
        viewModel = UserInfoViewModel(follower: follower)
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func setup() {
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func didTapDone() {
        dismiss(animated: true)
    }
    
    private func layoutView() {
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}

extension UserInfoViewController: UserInfoViewModelProtocol {
    func handleSuccess(with user: User) {
        DispatchQueue.main.async {
            self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
        }
    }
}
