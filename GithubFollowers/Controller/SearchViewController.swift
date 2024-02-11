//
//  SearchViewController.swift
//  GithubFollowers
//
//  Created by NJ Development on 02/02/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let searchView = SearchView()
    
    override func loadView() {
        super.loadView()
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        
    }
}

