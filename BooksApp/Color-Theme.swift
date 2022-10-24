//
//  Color-Theme.swift
//  BooksApp
//
//  Created by Matěj Mauler on 19.10.2022.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    static var backgroundColor: Color {
        Color(red: 0.77, green: 0.64, blue: 0.62)
    }
    
    static var contrastColor: Color {
        Color(red: 1, green: 0.78, blue: 0.67)
    }
    
    static var darkColor: Color {
        Color(red: 0, green: 0.16, blue: 0.2)
    }
    
    static var searchBackgroundColor: Color {
        Color(red: 0.67, green: 0.54, blue: 0.52)
    }
}
