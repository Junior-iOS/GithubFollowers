//
//  GFTitleLabel.swift
//  GithubFollowers
//
//  Created by NJ Development on 12/02/24.
//

import Foundation
import UIKit

class GFTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, numberOfLines: Int = 0) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.numberOfLines = numberOfLines
        configure()
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
