//
//  Restaurant.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation

struct RestaurantList: Codable, Equatable {
    let restaurants: [Restaurant]
}

struct Restaurant: Codable, Identifiable, Equatable {
    let id: String
    let name: String
    let cuisines: [Cuisine]
    let rating: Rating
    let address: Address
    let logoUrl: String
}
