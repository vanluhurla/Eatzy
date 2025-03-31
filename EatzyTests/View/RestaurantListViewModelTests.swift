//
//  RestaurantListViewModelTests.swift
//  EatzyTests
//
//  Created by Vanessa Lucena on 30/03/2025.
//

import Testing
import SwiftData
@testable import Eatzy

@Suite(.tags(.restaurants))
@MainActor
struct RestaurantListViewModelTests {
    
    var restaurantProvider: RestaurantProviderMock!
    var sut: RestaurantListViewModel!
    
    init() {
        restaurantProvider = RestaurantProviderMock()
        sut = RestaurantListViewModel(restaurantProvider: restaurantProvider)
    }

    @Test("Tests fetch a restaurant successfully")
    func fetchRestaurantsSuccess() async {
        // When
        await sut.didSelectPostcode("postcode")
        // Then
        #expect(sut.restaurants.count == 1)
        #expect(sut.error == nil)
    }
    
    @Test("Tests fetch a restaurant failure")
    func fetchRestaurantsFailure() async {
        // Given
        restaurantProvider.shouldThrowError = true
        // When
        await sut.didSelectPostcode("postcode")
        // Then
        #expect(sut.restaurants.count == 0)
        #expect(sut.error != nil)
    }
    
    @Test("Tests first restaurant ID")
    func restaurantObject() async throws {
        // When
        await sut.didSelectPostcode("Postcode")
        let restaurant = try #require(sut.restaurants.first)
        // Then
        #expect(restaurant.id == "abc01")
    }
}
