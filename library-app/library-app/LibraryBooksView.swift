//
//  LibraryBooksView.swift
//  library-app
//
//  Created by user on 08/06/2023.
//

import SwiftUI
import CoreData

struct LibraryBooksView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var library: Library
    @FetchRequest(
        sortDescriptors: [SortDescriptor(\.title)]
    ) var booksList: FetchedResults<Book>

    var books: [Book] { booksList.filter( { $0.library?.name == self.library.name } ) }
    
    var body: some View {
        VStack{
            List(books) { book in
                NavigationLink("\(book.title!) by \(book.author!)", destination: UserInfoView(selectedBook: book))
            }
        }
        .contentShape(Rectangle())
        .padding()
        .navigationTitle(library.name!)
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture().onEnded{ gesture in
            if gesture.translation.width > 100 {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}
