//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(by username: String, page: Int,  completion: @escaping (Result<[Follower], ErrorMessage>) -> Void) {
        let endpoint = "\(baseURL)\(username)/followers?per_page=50&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data else {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let followers = try JSONDecoder().decode([Follower].self, from: data)
                completion(.success(followers))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
