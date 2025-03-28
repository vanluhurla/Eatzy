//
//  RestaurantProviderMock.swift
//  EatzyTests
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation
@testable import Eatzy

class RestaurantProviderMock: RestaurantProviderProtocol {
    
    var shouldThrowError: Bool = false
    
    func getRestaurantList(postcode: String, limit: String) async throws -> [Restaurant] {
        if shouldThrowError {
            throw NetworkError.invalidData
        } else {
            return Restaurant.mocks
        }
    }
}
