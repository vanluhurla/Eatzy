//
//  ColourTheme.swift
//  Eatzy
//
//  Created by Vanessa Lucena on 31/03/2025.
//

import SwiftUI

struct ColourTheme {
    let accent = Color.accentColor
    let backgroundPrimary = Color.backgroundPrimary
    let backgroundSecondary = Color.backgroundSecondary
    let searchIconBackground = Color.searchIconBackground
    let text = Color.text
}

extension Color {
    static let theme = ColourTheme()
}

