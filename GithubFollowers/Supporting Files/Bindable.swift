//
//  Bindable.swift
//  GithubFollowers
//
//  Created by NJ Development on 12/02/24.
//

import Foundation

class Bindable<T> {
    fileprivate var observers: [((T) -> Void)] = []

    var value: T {
        didSet {
            observers.forEach { observe in
                observe(value)
            }
        }
    }

    init(value: T) {
        self.value = value
    }

    func bind(observer: @escaping (T) -> Void) {
        self.observers.append(observer)
    }
}
