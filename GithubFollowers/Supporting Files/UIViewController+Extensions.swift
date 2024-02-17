//
//  UIViewController+Extensions.swift
//  GithubFollowers
//
//  Created by NJ Development on 12/02/24.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alert = GFAlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alert.modalPresentationStyle = .overFullScreen
            alert.modalTransitionStyle = .crossDissolve
            self.present(alert, animated: true)
        }
    }
}
