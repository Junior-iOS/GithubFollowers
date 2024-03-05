//
//  GFAlertViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 12/02/24.
//

import UIKit

final class GFAlertViewController: UIViewController {
    
    private let alertView = GFAlertView()
    private let viewModel: GFAlertViewModel
    
    override func loadView() {
        super.loadView()
        self.view = alertView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.configure(with: viewModel)
        alertView.delegate = self
    }
    
    init(title: String?, message: String?, buttonTitle: String?) {
        self.viewModel = GFAlertViewModel(alertTitle: title, message: message, buttonTitle: buttonTitle)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
}

extension GFAlertViewController: GFAlertViewProtocol {
    func didTapButton() {
        dismiss(animated: true)
    }
}
