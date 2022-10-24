//
//  BookArrayView.swift
//  BooksApp
//
//  Created by Matěj Mauler on 20.10.2022.
//

import SwiftUI

struct BookArrayView: View {
    @ObservedObject var bookCollection: BookCollection
    @State var detailedBook = Book(id: "", volumeInfo: Book.VolumeInfo(title: "", description: "", publishedDate: "", authors: [""], imageLinks: nil, infoLink: ""))
    var body: some View {
        
        List(bookCollection.fetchedBooks, id: \.id) { book in
            NavigationLink {
                BookDetailView(detailedBook: $detailedBook)
                    .onAppear {
                        detailedBook = book
                    }
                
            } label: {
                HStack{
                    AsyncImage(url: URL(string: book.volumeInfo.imageLinks?.smallThumbnail ?? "DefaultBookCover")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image("DefaultBookCover")
                            .resizable()
                            .scaledToFit()
                    }.frame(width: 80, height: 130)
                    
                    VStack(alignment: .leading) {
                        Text("\(book.volumeInfo.title)")
                            .font(.title.bold())
                            .foregroundColor(.darkColor)
                        
                        ForEach(book.volumeInfo.authors ?? ["Autor nebyl nalezen"], id: \.self) { author in
                            Text(author)
                                .font(.headline.bold())
                                .foregroundColor(.darkColor)
                        }
                    }
                }
            }
            .listRowBackground(Color.backgroundColor)
        }
        .background(.backgroundColor)
        .listStyle(.plain)
    }
}

