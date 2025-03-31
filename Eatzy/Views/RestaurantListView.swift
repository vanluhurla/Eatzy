//
//  RestaurantListView.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 27/03/2025.
//

import SwiftUI

struct RestaurantListView: View {
    @ObservedObject var viewModel: RestaurantListViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .task {
            await viewModel.didSelectPostcode("ME99BW")
        }
        .padding()

    }
}

//#Preview {
//    RestaurantListView()
//}
