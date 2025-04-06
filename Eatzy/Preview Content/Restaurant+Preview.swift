//
//  Restaurant+Preview.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 03/04/2025.
//

import Foundation

extension Restaurant {
    static var previewMock: Restaurant {
        Restaurant(id:"abc01",
                   name: "Restaurant Name Restaurant Name Restaurant Name Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name"), Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 4.5),
                   address: Address(city: "City", firstLine: "First Line First Line First Line Line First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var previewMock2: Restaurant {
        Restaurant(id:"abc02",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 4.5),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var previewMock3: Restaurant {
        Restaurant(id:"abc03",
                   name: "Restaurant Name",
                   cuisines: [Cuisine(name: "Cuisine name")],
                   rating: Rating(count: 100, starRating: 4.5),
                   address: Address(city: "City", firstLine: "First Line", postalCode: "Postcode"),
                   logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif")
    }
    
    static var previewMockMocks: [Restaurant] {
        [previewMock, previewMock2 ,previewMock3]
    }
}
