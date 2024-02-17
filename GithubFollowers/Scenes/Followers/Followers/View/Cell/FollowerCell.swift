//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func setupConstraints() {
        addSubviews(avatarImageView, usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: .padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    public func configure(with follower: Follower) {
        self.avatarImageView.image = UIImage(named: follower.avatarURL)
        self.usernameLabel.text = follower.login
    }
}

fileprivate extension CGFloat {
    static let padding = 8.0
}
