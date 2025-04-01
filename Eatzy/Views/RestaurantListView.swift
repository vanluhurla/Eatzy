//
//  RestaurantListView.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 27/03/2025.
//

import SwiftUI

struct RestaurantListView: View {
    
    @ObservedObject var viewModel: RestaurantListViewModel
    @State private var searchPostcode: String = ""
    
    var body: some View {
        VStack {
            SearchTextField(searchText: $searchPostcode)
            restaurantList
        }
        .onAppear {
            Task {
                await viewModel.didSelectPostcode("ME9 9BW")
            }
        }
        .padding()
    }
    
    var restaurantList: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 12) {
                ForEach(viewModel.restaurants) { restaurant in
                    RestaurantListCell(
                        name: restaurant.name,
                        firstLineAddress: restaurant.address.firstLine,
                        city: restaurant.address.city,
                        starRating: restaurant.rating.starRating,
                        ratingCount: restaurant.rating.count,
                        logoUrl: restaurant.logoUrl,
                        cuisines: restaurant.cuisines.prefix(2).map { $0.name }
                    )
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(viewModel: RestaurantListViewModel(restaurantProvider: RestaurantProvider()))
    }
}
