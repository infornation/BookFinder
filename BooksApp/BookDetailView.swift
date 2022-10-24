//
//  BookDetailView.swift
//  BooksApp
//
//  Created by Matěj Mauler on 19.10.2022.
//

import SwiftUI

struct BookDetailView: View {
    @Environment(\.openURL) var openURL
    @Binding var detailedBook: Book

    var publishedYear: String {
        let publishedDate: String = detailedBook.volumeInfo.publishedDate ?? "0000"
        let publishedYear = String(publishedDate.prefix(4))
        return publishedYear
    }
    
    var body: some View {
        ScrollView{
            VStack{
                // MARK: Book cover
                HStack{
                    Spacer()
                    AsyncImage(url: URL(string: detailedBook.volumeInfo.imageLinks?.thumbnail ?? "")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            
                        
                    } placeholder: {
                        Image("DefaultBookCover")
                            .resizable()
                            .scaledToFit()
                    }.frame(width: 300,height: 300)
                    Spacer()
                }
                
                // MARK: About book
                
                Text(detailedBook.volumeInfo.title)
                    .font(.largeTitle)
                    .foregroundColor(.darkColor)
                
                ForEach(detailedBook.volumeInfo.authors ?? ["Autor nebyl nalezen."], id: \.self) { author in
                    Text(author)
                        .foregroundColor(.darkColor)
                }
                
                if publishedYear != "0000" {
                    Text(publishedYear)
                        .foregroundColor(.darkColor)
                } else {
                    Text("Rok vydání nebyl nalezen")
                        .foregroundColor(.darkColor)
                }
                
                // Divider
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 1)
                    .foregroundColor(.darkColor)
                
                VStack{
                    Text(detailedBook.volumeInfo.description ?? "Popis knihy nebyl nalezen.")
                        .foregroundColor(.darkColor)
                }
                .padding()
                
                // MARK: Link na GooglePlay
                
                Button {
                    openURL(URL(string: detailedBook.volumeInfo.infoLink ?? "https://play.google.com/store/books/")!)
                } label: {
                    VStack{
                        Text(" Více na Google Play")
                            .padding()
                            .foregroundColor(.backgroundColor)
                    }
                    .background(.darkColor)
                    .clipShape(Capsule())
                }
            }
            .background(.backgroundColor)
        }
        .background(.backgroundColor)
    }
}
