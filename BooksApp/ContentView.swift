//
//  ContentView.swift
//  BooksApp
//
//  Created by Matěj Mauler on 19.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var bookCollection = BookCollection()
    @State var searchedAuthor = ""
    @State var selectedBookId: String = ""
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                
                // MARK: Search field
                
                VStack(alignment: .leading) {
                    HStack {
                        TextField("Zadej jméno autora...", text: $searchedAuthor)
                            .autocorrectionDisabled(true)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                            .background(RoundedRectangle(cornerRadius: 10).fill(.searchBackgroundColor))
                            .foregroundColor(.darkColor)
                        
                        
                        Button {
                            // fetchin books to BooksCollection
                            bookCollection.fetchBooks(author: searchedAuthor)
                            
                        } label: {
                            Image(systemName: "magnifyingglass.circle")
                                .resizable()
                                .frame(width: 50.0, height: 50.0)
                                .foregroundColor(.darkColor)
                        }
                        .foregroundColor(.darkColor)
                        
                    }
                    .padding()
                }
                .background(.backgroundColor)
                .navigationTitle("KnihoHledač")
                
                // Divider
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 1)
                    .background(.darkColor)
                
                // MARK: List of books from author
                
                if bookCollection.fetchedBooks.isEmpty {
                    ScrollView{
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Color.darkColor)
                            .padding()
                        
                        Text("Zadej autora pro výpis jeho knih.")
                            .font(.largeTitle.bold())
                            .foregroundColor(Color.darkColor)
                    }
                } else {
                    BookArrayView(bookCollection: bookCollection)
                }
                
            }
            .background(.backgroundColor)
        }
        .background(.backgroundColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

