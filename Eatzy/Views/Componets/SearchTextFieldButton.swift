//
//  SearchTextFieldButton.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct SearchTextFieldButton: View {
    
    struct Metrics {
        static let width: CGFloat = 50
        static let height: CGFloat = 50
    }
    
    var iconName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.theme.searchIconBackground)
                .frame(width: Metrics.width, height: Metrics.height)
            
            Image(systemName: iconName)
                .font(.system(size: 23))
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.accent)
        }
    }
}

struct SearchTextFieldButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldButton(iconName: "magnifyingglass")
    }
}
