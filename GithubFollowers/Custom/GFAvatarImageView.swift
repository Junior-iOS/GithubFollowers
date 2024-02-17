//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import UIKit

class GFAvatarImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = UIImage(named: "avatar-placeholder")
        translatesAutoresizingMaskIntoConstraints = false
    }

}
