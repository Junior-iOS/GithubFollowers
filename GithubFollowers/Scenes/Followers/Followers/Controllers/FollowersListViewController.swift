//
//  FollowersListViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    private let followersView = FollowersListView()
    private let viewModel: FollowersListViewModel
    private var dataSource: UICollectionViewDiffableDataSource<Section, Follower>?
    
    override func loadView() {
        super.loadView()
        self.view = followersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureDataSource()
        configureDelegate()
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
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: followersView.collectionView, cellProvider: { collectionView, indexPath, follower -> UICollectionViewCell in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as? FollowerCell else { return UICollectionViewCell() }
            cell.configure(with: follower)
            return cell
        })
    }
    
    private func configureDelegate() {
        followersView.collectionView.delegate = self
    }
}

extension FollowersListViewController: FollowersViewModelProtocol {
    func showAlert(for error: String) {
        presentAlert(title: "Ops!", message: error, buttonTitle: "Ok")
    }
    
    func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.followers)
        DispatchQueue.main.async {
            self.dataSource?.apply(snapshot, animatingDifferences: true)
        }
    }
}

extension FollowersListViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard viewModel.hasMoreFollowers else { return }
            viewModel.page += 1
            viewModel.loadFollowers(for: viewModel.userName, page: viewModel.page)
        }
    }
}
