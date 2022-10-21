//
//  BookArrayView.swift
//  BooksApp
//
//  Created by Matěj Mauler on 20.10.2022.
//

import SwiftUI

struct BookArrayView: View {
    
    
    var body: some View {
        List(bookCollection.fetchedBooks, id: \.id) { book in
                NavigationLink {
                    BookDetailView()
                } label: {
                    HStack{
                        AsyncImage(url: URL(string: book.volumeInfo.imageLinks?.smallThumbnail ?? "")) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                
                            
                        } placeholder: {
                            Color.gray
                        }.frame(width: 80, height: 130)

                        VStack(alignment: .leading) {
                            Text("\(book.volumeInfo.title)")
                                .font(.title.bold())
                                .foregroundColor(.darkColor)
                            
                            ForEach(book.volumeInfo.authors ?? ["Missing author"], id: \.self) { author in
                                Text(author)
                                    .font(.headline.bold())
                                    .foregroundColor(.darkColor)
                                    
                            }
                        }
                    }
                   
                }
                .listRowBackground(Color.backgroundColor)
        }
        .listStyle(.plain)
    }
}

struct BookArrayView_Previews: PreviewProvider {
    static var previews: some View {
        BookArrayView()
    }
}
