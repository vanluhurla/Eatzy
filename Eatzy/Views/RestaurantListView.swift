//
//  RestaurantListView.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 27/03/2025.
//

import SwiftUI

struct RestaurantListView: View {
    
    struct Metrics {
        static let medium: CGFloat = 12
    }
    
    @ObservedObject var viewModel: RestaurantListViewModel
    @State private var searchPostcode: String = ""
    
    var body: some View {
        ZStack{
            Color.clear
            VStack {
                searchTextField
                if viewModel.error != nil {
                    PlaceholderAnimation(text: "Check your postcode and try again.")
                } else if
                    viewModel.shouldDisplayPlaceholder {
                    PlaceholderAnimation(text: "Search by postcode or location.")
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            carouselHeader
                            BestRatedCarousel(restaurants: viewModel.bestRatedRestaurants)
                            listHeader
                            restaurantList
                        }
                    }
                    .scrollDismissesKeyboard(.immediately)
                }
            }
        }
        .ignoresSafeArea(.keyboard)
    }
    
    private var searchTextField: some View {
        SearchTextField(searchText: $searchPostcode,
            onSearchTapped: {
                Task {
                    await viewModel.didSelectPostcode(searchPostcode)
                }
            }
        )
    }
    
    private var carouselHeader: some View {
        HStack {
            Text("Best rated")
                .font(.title)
                .foregroundStyle(Color.theme.text)
                .fontWeight(.bold)
        }
        .padding(.top, Metrics.medium)
        .padding(.horizontal, Metrics.medium)
    }
    
    private var listHeader: some View {
        HStack {
            Text("Available in your area")
                .font(.title)
                .foregroundStyle(Color.theme.text)
                .fontWeight(.bold)
        }
        .padding(.top, Metrics.medium)
        .padding(.horizontal, Metrics.medium)
    }
    
    private var restaurantList: some View {
        LazyVStack(spacing: Metrics.medium) {
            ForEach(viewModel.availableRestaurants) { restaurant in
                RestaurantListCell(restaurant: restaurant
                )
            }
        }
        .padding(Metrics.medium)
        .frame(maxWidth: .infinity)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView(viewModel: RestaurantListViewModel(restaurantProvider: RestaurantProvider()))
    }
}
