//
//  RestaurantListCell.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct RestaurantListCell: View {
    
    struct Metrics {
        static let small: CGFloat = 4
        static let medium: CGFloat = 12
        static let large: CGFloat = 16
        static let radius: CGFloat = 12
        static let logoSize: CGFloat = 50
        static let logoCornerRadius: CGFloat = 8
    }
    
    var restaurant: Restaurant
    var cuisines: String {
        restaurant.cuisines.prefix(2)
            .map { $0.name }
            .joined(separator: ", ")
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: Metrics.medium) {
            restaurantLogo
            restaurantDetails
            Spacer()
        }
        .padding(.horizontal, Metrics.medium)
        .padding(.vertical, Metrics.large)
        .background(Color.theme.backgroundSecondary)
        .clipShape(.rect(cornerRadius: Metrics.radius))
    }
    
    var restaurantDetails: some View {
        VStack(alignment: .leading,
               spacing: Metrics.large) {
            VStack(alignment: .leading,
                   spacing: Metrics.small) {
                restaurantName
                restaurantAddress
            }
            restaurantRating
        }
    }
    
    var restaurantName: some View {
        Text(restaurant.name)
            .font(.headline)
            .lineLimit(2)
    }
    
    var restaurantAddress: some View {
        Text(restaurant.address.firstLine + " - " + restaurant.address.city)
            .font(.subheadline)
            .lineLimit(2)
    }
    
    var restaurantRating: some View {
        HStack(spacing: Metrics.small) {
            Image(systemName: "star.fill")
                .font(.subheadline)
                .foregroundStyle(Color.theme.accent)
            
            Text(String(restaurant.rating.starRating))
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("(\(restaurant.rating.count))")
                .font(.subheadline)
                .fontWeight(.light)
            
            Text("• \(cuisines)")
                .font(.system(size: 12))
        }
    }
    
    var restaurantLogo: some View {
        VStack {
            AsyncImage(url: URL(string:restaurant.logoUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: Metrics.logoSize, height: Metrics.logoSize)
            .clipShape(.rect(cornerRadius: Metrics.logoCornerRadius))
        }
    }
}

struct RestaurantListCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RestaurantListCell(restaurant: Restaurant.previewMock)
        }
        .padding()
    }
}
