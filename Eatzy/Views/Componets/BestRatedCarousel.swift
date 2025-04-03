//
//  BestRatedCarousel.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 03/04/2025.
//

import SwiftUI

struct BestRatedCarousel: View {
    
    struct Metrics {
        static let medium: CGFloat = 12
        static let large: CGFloat = 40
        static let carouselHeight: CGFloat = 190
    }
    
    var restaurants: [Restaurant]
    
    init(restaurants: [Restaurant]) {
        self.restaurants = restaurants
        UIPageControl.appearance().currentPageIndicatorTintColor = .accent
        UIPageControl.appearance().pageIndicatorTintColor = .accent.withAlphaComponent(0.4)
    }
    
    var body: some View {
        TabView {
            ForEach(restaurants) { restaurant in
                RestaurantListCell(restaurant: restaurant)
                    .padding(.horizontal, Metrics.medium)
                    .padding(.bottom, Metrics.large)
            }
        }
        .tabViewStyle(.page)
        .frame(height: Metrics.carouselHeight)
    }
}

struct BestRatedCarousel_Previews: PreviewProvider {
    static var previews: some View {
        BestRatedCarousel(restaurants: Restaurant.previewMockMocks)
    }
}
