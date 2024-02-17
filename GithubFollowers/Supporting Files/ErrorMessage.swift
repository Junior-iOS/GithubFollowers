//
//  ErrorMessage.swift
//  GithubFollowers
//
//  Created by NJ Development on 16/02/24.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidRequest = "Invalid request. Please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "Invalid data. Please try again"
}
