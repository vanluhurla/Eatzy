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
    
    @Published var error: Error?
    @Published var bestRatedRestaurants = [Restaurant]()
    @Published var availableRestaurants = [Restaurant]()
    
    private let restaurantProvider: RestaurantProviderProtocol
    private let restaurantLimit = "10"
    
    init(restaurantProvider: RestaurantProviderProtocol) {
        self.restaurantProvider = restaurantProvider
    }
    
    func didSelectPostcode(_ postcode: String) async {
        do {
            let fetchedRestaurants = try await restaurantProvider.getRestaurantList(postcode: postcode, limit: restaurantLimit)
            organiseRestaurants(fetchedRestaurants)
        } catch {
            self.error = error
        }
    }
}

private extension RestaurantListViewModel {
    func organiseRestaurants(_ restaurants: [Restaurant]) {
        bestRatedRestaurants = restaurants
            .sorted { $0.rating.starRating > $1.rating.starRating }
            .prefix(3)
            .map { $0 }
        availableRestaurants = restaurants.filter { !bestRatedRestaurants.contains($0)}
    }
}
