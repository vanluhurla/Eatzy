//
//  SearchTextField.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct SearchTextField: View {
    
    struct Metrics {
        static let small: CGFloat = 6
        static let medium: CGFloat = 12
        static let height: CGFloat = 60
    }
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText )
                .font(.system(size: 20)).bold()
                .foregroundStyle(Color.theme.text)
                .background(Color.theme.backgroundSecondary)
                .padding()
            
            Button {
                
            } label: {
                SearchTextFieldButton(iconName: "magnifyingglass")
            }
            
            Button {
                
            } label: {
                SearchTextFieldButton(iconName: "location")
            }
            .padding(.trailing, Metrics.small)
        }
        .frame(height: Metrics.height)
        .background(Color.theme.backgroundSecondary)
        .clipShape(Rectangle())
        .cornerRadius(Metrics.medium)
        .padding(Metrics.medium)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(searchText: .constant(""))
    }
}
