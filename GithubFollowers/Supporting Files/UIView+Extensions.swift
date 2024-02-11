//
//  UIView+Extensions.swift
//  GithubFollowers
//
//  Created by NJ Development on 11/02/24.
//

import Foundation
import UIKit

extension UIView {
    static var identifier: String { return String(describing: self) }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }
}
