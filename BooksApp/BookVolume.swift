//
//  Book.swift
//  BooksApp
//
//  Created by Matěj Mauler on 19.10.2022.
//

import SwiftUI

struct BookVolume: Codable {
    var items: Books
    
    struct Books: Codable, Identifiable {
        let id: String
        let title: String
        let author: String
        let cover: String
        let bookDescription: String
        let publishedDate: Int
    }
    
   
}
