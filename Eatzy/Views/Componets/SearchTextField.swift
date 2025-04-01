//
//  SearchTextField.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct SearchTextField: View {
    
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
            .padding(.trailing, 5)
        }
        .frame(height: 60)
        .background(Color.theme.backgroundSecondary)
        .clipShape(Rectangle())
        .cornerRadius(12)
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(searchText: .constant(""))
    }
}
