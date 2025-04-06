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
        #expect(sut.bestRatedRestaurants.count == 3)
        #expect(sut.availableRestaurants.count == 2)
        #expect(sut.error == nil)
    }
    
    @Test("Tests fetch a restaurant failure")
    func fetchRestaurantsFailure() async {
        // Given
        restaurantProvider.shouldThrowError = true
        // When
        await sut.didSelectPostcode("postcode")
        // Then
        #expect(sut.bestRatedRestaurants.count == 0)
        #expect(sut.availableRestaurants.count == 0)
        #expect(sut.error != nil)
    }
    
    @Test("Tests best rated restaurant are in correct order ")
    func bestRatedRestaurantsObject() async throws {
        // When
        await sut.didSelectPostcode("Postcode")
        let restaurants = try #require(sut.bestRatedRestaurants)
        // Then
        #expect(restaurants.count == 3)
        #expect(restaurants[0].rating.starRating > restaurants[1].rating.starRating)
        #expect(restaurants[1].rating.starRating > restaurants[2].rating.starRating)

    }
    
    @Test("Tests available restaurants are not included in best rated")
    func availableRestaurantsObject() async throws {
        // When
        await sut.didSelectPostcode("Postcode")
        let bestRatedRestaurants = try #require(sut.bestRatedRestaurants)
        let availableRestaurants = try #require(sut.availableRestaurants)
        // Then
        #expect(availableRestaurants.count == 2)
        #expect(availableRestaurants.contains(bestRatedRestaurants[0]) == false)
        #expect(availableRestaurants.contains(bestRatedRestaurants[1]) == false)
        #expect(availableRestaurants.contains(bestRatedRestaurants[2]) == false)
    }
    
    @Test("Tests placeholder animation appearance when no postcode applied")
    func placeholderAnimationOnScreen() async throws {
        // Given
        restaurantProvider.shouldReturnResults = false
        // When
        await sut.didSelectPostcode("Postcode")
        // Then
        #expect(sut.bestRatedRestaurants.count == 0)
        #expect(sut.availableRestaurants.count == 0)
        #expect(sut.shouldDisplayPlaceholder == true)
    }
    
    @Test("Tests hidden placeholder when postcode applied")
    func hiddenPlaceholderAnimation() async throws {
        // When
        await sut.didSelectPostcode("Postcode")
        // Then
        #expect(sut.bestRatedRestaurants.count == 3)
        #expect(sut.availableRestaurants.count == 2)
        #expect(sut.shouldDisplayPlaceholder == false)
    }
}
