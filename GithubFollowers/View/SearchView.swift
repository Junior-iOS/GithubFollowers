//
//  SearchView.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import UIKit

class SearchView: UIView {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let actionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureLogoImageView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    private func configureLogoImageView() {
        addSubviews(logoImageView, usernameTextField, actionButton)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .eighty),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: .twoHundred),
            logoImageView.heightAnchor.constraint(equalToConstant: .twoHundred),
            
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: .fortyEight),
            usernameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .fifty),
            usernameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .negativeFifty),
            usernameTextField.heightAnchor.constraint(equalToConstant: .fifty),
            
            actionButton.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            actionButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: .negativeFifty),
            actionButton.heightAnchor.constraint(equalToConstant: .fifty)
        ])
    }
}

fileprivate extension CGFloat {
    static let fortyEight = 48.0
    static let fifty = 50.0
    static let negativeFifty = fifty * -1
    static let eighty = 80.0
    static let twoHundred = 200.0
}
