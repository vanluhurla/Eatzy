//
//  NetworkError.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation

enum NetworkError: Error {
    case urlNotFound
    case invalidResponse
    case invalidData
    
    var description: String {
        switch self {
        case .urlNotFound:
            return "URL not found"
        case .invalidResponse:
            return "Invalid response"
        case .invalidData:
            return "Invalid data"
        }
    }
}
