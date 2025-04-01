//
//  SearchTextFieldButton.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct SearchTextFieldButton: View {
    
    var iconName: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.theme.searchIconBackground)
                .frame(width: 50, height: 50)
            
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
