//
//  Restaurant+Mock.swift
//  EatzyTests
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation
@testable import Eatzy

extension Restaurant {
    static var mock: Restaurant {
        Restaurant(id:"abc01",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 4.5),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var mocks: [Restaurant] {
        [mock]
    }
}
