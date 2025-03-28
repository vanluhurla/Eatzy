//
//  RestaurantProvider.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 28/03/2025.
//

import Foundation

protocol RestaurantProviderProtocol {
    func getRestaurantList(postcode: String, limit: String) async throws -> [Restaurant]
}

class RestaurantProvider: RestaurantProviderProtocol {
    func getRestaurantList(postcode: String, limit: String) async throws -> [Restaurant] {
        guard var urlComponents = URLComponents(string: NetworkURL.discoverUrl(postcode: postcode)) else {
            throw NetworkError.urlNotFound
        }
        
        let queryItem = URLQueryItem(name: "limit", value: limit)
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + [queryItem]
        guard let url = urlComponents.url else {
            throw NetworkError.urlNotFound
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(RestaurantList.self, from: data).restaurants
        } catch {
            throw NetworkError.invalidData
        }
    }
}
