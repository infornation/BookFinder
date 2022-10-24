//
//  Book.swift
//  BooksApp
//
//  Created by Matěj Mauler on 19.10.2022.
//

import SwiftUI

struct Book: Codable, Identifiable {
    let id: String
    let volumeInfo: VolumeInfo

    struct VolumeInfo: Codable {
        let title: String
        let description: String?
        let publishedDate: String?
        let authors: [String]?
        let imageLinks: ImageLinks?
        let infoLink: String?
        
        struct ImageLinks: Codable {
            let smallThumbnail: String?
            let thumbnail: String?
        }
    }
}

struct BookVolume: Codable {
    var items: [Book]
}
