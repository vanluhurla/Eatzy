//
//  NetworkURLTests.swift
//  EatzyTests
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Testing
@testable import Eatzy

@Suite(.tags(.networking))
struct NetworkURLTests {

    @Test("Test base URL integrity")
    func baseUrl() async throws {
        #expect(NetworkURL.baseUrl == "https://uk.api.just-eat.io")
    }
    
    @Test("Test discover URL path")
    func discoverUrl() async throws {
        #expect(NetworkURL.discoverUrl(postcode: "ME99BW") == "https://uk.api.just-eat.io/discovery/uk/restaurants/enriched/bypostcode/ME99BW")
    }
}
