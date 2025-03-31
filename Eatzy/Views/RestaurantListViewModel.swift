//
//  RestaurantListViewModel.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 30/03/2025.
//

import Foundation
import SwiftUI

@MainActor
class RestaurantListViewModel: ObservableObject {
    
    @Published var restaurants = [Restaurant]()
    @Published var error: Error?
    
    private let restaurantProvider: RestaurantProviderProtocol
    private let restaurantLimit = "10"
    
    init(restaurantProvider: RestaurantProviderProtocol) {
        self.restaurantProvider = restaurantProvider
    }
    
    func didSelectPostcode(_ postcode: String) async {
        do {
            let fetchedRestaurants = try await restaurantProvider.getRestaurantList(postcode: postcode, limit: restaurantLimit)
            self.restaurants = fetchedRestaurants
        } catch {
            self.error = error
        }
    }
}
