//
//  FollowersListView.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import UIKit

class FollowersListView: UIView {
    
    private (set) lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: bounds, collectionViewLayout: createFlowLayout())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .systemBackground
        collection.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.identifier)
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func setupConstraints() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let width = UIScreen.main.bounds.width
        let padding: CGFloat = 12
        let spacingBetweenCells: CGFloat = 10
        let availableWidth = width - (padding * 2) - (spacingBetweenCells * 2)
        let cellWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth + 40)
        
        return flowLayout
    }
}
