//
//  RestaurantListCell.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct RestaurantListCell: View {
    
    struct Metrics {
        static let horizontalSpacing: CGFloat = 12
        static let verticalSpacing: CGFloat = 16
        static let ratingSpacing: CGFloat = 4
        static let cellCornerRadius: CGFloat = 12
        static let logoSize: CGFloat = 50
        static let logoCornerRadius: CGFloat = 8
    }
    
    var name: String
    var firstLineAddress: String
    var city: String
    var starRating: Double
    var ratingCount: Int
    var logoUrl: String
    var cuisines: [String]
    
    var body: some View {
        HStack(alignment: .top, spacing: Metrics.horizontalSpacing) {
            restaurantLogo
            restaurantDetails
            Spacer()
        }
        .padding(.horizontal, Metrics.horizontalSpacing)
        .padding(.vertical, Metrics.verticalSpacing)
        .background(Color.theme.backgroundSecondary)
        .clipShape(.rect(cornerRadius: Metrics.cellCornerRadius))
    }
    
    var restaurantDetails: some View {
        VStack(alignment: .leading,
               spacing: Metrics.verticalSpacing) {
            restaurantName
            restaurantAddress
            restaurantRating
        }
    }
    
    var restaurantName: some View {
        Text(name)
            .font(.headline)
            .lineLimit(2)
    }
    
    var restaurantAddress: some View {
        Text(firstLineAddress + " - " + city)
            .font(.subheadline)
            .lineLimit(2)
    }
    
    var restaurantRating: some View {
        HStack(spacing: Metrics.ratingSpacing) {
            Image(systemName: "star.fill")
                .font(.subheadline)
                .foregroundStyle(Color.theme.accent)
            
            Text(String(starRating))
                .font(.subheadline)
                .fontWeight(.medium)
            
            Text("(\(ratingCount))")
                .font(.subheadline)
                .fontWeight(.light)

            Text("• \(cuisines.joined(separator: ", "))")
                .font(.system(size: 12))
        }
    }
    
    var restaurantLogo: some View {
        VStack {
            AsyncImage(url: URL(string:logoUrl)) { image in
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
            RestaurantListCell(
                name: "McDonald's® - Sittingbourne McDelivery Kitchen",
                firstLineAddress: "Unit 2, Crown Quay Trade Centre\r\nEurolink Way",
                city: "Sittingbourne",
                starRating: 4.5,
                ratingCount: 230,
                logoUrl: "https://d30v2pzvrfyzpo.cloudfront.net/uk/images/restaurants/191316.gif",
                cuisines: [
                    "Burgers",
                    "Chicken"
                ]
            )
        }
        .padding()
    }
}
