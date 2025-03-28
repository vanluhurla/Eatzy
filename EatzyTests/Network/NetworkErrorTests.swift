//
//  NetworkErrorTests.swift
//  EatzyTests
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Testing
@testable import Eatzy

@Suite(.tags(.networking))
struct NetworkErrorTests {

    @Test("URL not found message")
    func urlNotFoundError() async throws {
        #expect(NetworkError.urlNotFound.description == "URL not found")
    }
    
    @Test("Invalid response message")
    func invalidResponseError() async throws {
        #expect(NetworkError.invalidResponse.description == "Invalid response")
    }
    
    @Test("Invalid data message")
    func invalidDataError() async throws {
        #expect(NetworkError.invalidData.description == "Invalid data")
    }
}
