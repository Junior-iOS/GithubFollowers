//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    private let cache = NetworkManager.shared.cache

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

    func downloadImage(from urlString: String) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data)
            else { return }
            
            self?.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self?.image = image }
        }
        
        task.resume()
    }
}
