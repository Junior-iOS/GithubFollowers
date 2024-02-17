//
//  GFAlertViewModel.swift
//  GithubFollowers
//
//  Created by NJ Development on 12/02/24.
//

import Foundation
import UIKit

final class GFAlertViewModel {
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    init(alertTitle: String? = nil, message: String? = nil, buttonTitle: String? = nil) {
        self.alertTitle = alertTitle
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}
