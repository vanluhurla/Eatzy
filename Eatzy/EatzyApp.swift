//
//  EatzyApp.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 27/03/2025.
//

import SwiftUI

@main
struct EatzyApp: App {
    
    let restaurantProvider = RestaurantProvider()
   
    var body: some Scene {
        WindowGroup {
            RestaurantListView(viewModel: RestaurantListViewModel(restaurantProvider: restaurantProvider))
        }
    }
}
