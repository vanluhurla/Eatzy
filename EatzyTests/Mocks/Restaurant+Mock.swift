//
//  Restaurant+Mock.swift
//  EatzyTests
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation
@testable import Eatzy

extension Restaurant {
    static var mock1: Restaurant {
        Restaurant(id:"abc01",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 4.5),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var mock2: Restaurant {
        Restaurant(id:"abc02",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 3.2),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var mock3: Restaurant {
        Restaurant(id:"abc03",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 2.7),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var mock4: Restaurant {
        Restaurant(id:"abc04",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 1.0),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var mock5: Restaurant {
        Restaurant(id:"abc05",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 3.8),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var mocks: [Restaurant] {
        [mock1, mock2, mock3, mock4, mock5]
    }
}
