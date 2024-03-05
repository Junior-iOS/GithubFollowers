//
//  GFUserInfoHeaderViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 23/02/24.
//

import UIKit

class GFUserInfoHeaderViewController: UIViewController {
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    let locationImageView = UIImageView()
    let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    let bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureUI()
    }
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func setupView() {
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubviews(avatarImageView,
                         usernameLabel,
                         nameLabel,
                         locationImageView,
                         locationLabel,
                         bioLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: .padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: .imageSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: .imageSize),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: .textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: .textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            locationImageView.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: locationImageView.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: usernameLabel.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: .textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func configureUI() {
        avatarImageView.downloadImage(from: user.avatarURL)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio avaliable"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
    }
}

fileprivate extension CGFloat {
    static let padding = 20.0
    static let textImagePadding = 12.0
    static let imageSize = 90.0
}
