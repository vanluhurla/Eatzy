//
//  NetworkURL.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation

struct NetworkURL {
    static let baseUrl = "https://uk.api.just-eat.io"
    static func discoverUrl(postcode: String) -> String {
        baseUrl + "/discovery/uk/restaurants/enriched/bypostcode/\(postcode)"
    }
}
