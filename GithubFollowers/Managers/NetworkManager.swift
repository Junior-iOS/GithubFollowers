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
    
    enum Endpoint {
        case followers
        case user
    }
    
    private init() {}
    
    func fetchData<T: Decodable>(for type: T.Type,
                                 by username: String,
                                 with endpoint: Endpoint,
                                 per page: Int = 0,
                                 completion: @escaping (Result<T, ErrorMessage>) -> Void) {
        
        var endpointString = "\(baseURL)\(username)"
        
        if endpoint == .followers {
            endpointString += "/followers?per_page=50&page=\(page)"
        }
        
        guard let url = URL(string: endpointString) else {
            completion(.failure(.invalidRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            let result: Result<T, ErrorMessage>
            
            defer {
                completion(result)
            }
            
            guard error == nil, let data else {
                result = .failure(.unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                result = .failure(.invalidResponse)
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.self, from: data)
                result = .success(response)
            } catch {
                result = .failure(.invalidData)
            }
        }
        
        task.resume()
    }
}
