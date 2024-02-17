//
//  GFAlertView.swift
//  GithubFollowers
//
//  Created by NJ Development on 12/02/24.
//

import UIKit

protocol GFAlertViewProtocol: AnyObject {
    func didTapButton()
}

class GFAlertView: UIView {

    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButton = GFButton(backgroundColor: .systemPink, title: "Ok")
    
    weak var delegate: GFAlertViewProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupConstrainsts()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    private func setup() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.backgroundColor = .systemBackground
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.numberOfLines = 4
    }
    
    private func setupConstrainsts() {
        addSubviews(containerView)
        containerView.addSubviews(titleLabel, messageLabel, actionButton)
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -12),
            
            actionButton.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor),
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    public func configure(with viewModel: GFAlertViewModel) {
        self.titleLabel.text = viewModel.alertTitle
        self.messageLabel.text = viewModel.message
        self.actionButton.setTitle(viewModel.buttonTitle, for: .normal)
        self.actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
    }
    
    @objc private func didTapActionButton() {
        delegate?.didTapButton()
    }
}
