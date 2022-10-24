//
//  BookCollection.swift
//  BooksApp
//
//  Created by Matěj Mauler on 19.10.2022.
//

import Foundation

class BookCollection: ObservableObject {
    @Published var fetchedBooks: [Book] = []
    
    func fetchBooks(author: String) {
        // Replacing spaces with "+"
        let authorURL = author.replacingOccurrences(of: " ", with: "+")
        func removeDiacritics(author: String) -> String {
            return author.folding(options: .diacriticInsensitive, locale: .current)
        }

        // Final URL
        let urlString = "https://www.googleapis.com/books/v1/volumes?q=inauthor:%22" + removeDiacritics(author: authorURL) + "%22&langRestrict=cs&maxResults=40"
         
        print(urlString)
        
        // Controlling if URL is valid
        guard let url = URL(string: urlString) else {
            print("Couldn't create URL.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _,
            error in
            // Controlling if there are data in URL fetch
            guard let data = data, error == nil else {
                print("Couldn't get data.")
                return
            }
            
            // Processing data
            do {
                let fetched = try JSONDecoder().decode(BookVolume.self, from: data)
                DispatchQueue.main.async {
                    self?.fetchedBooks = fetched.items

                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
