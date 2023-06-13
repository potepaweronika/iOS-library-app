//
//  LibraryListView.swift
//  library-app
//
//  Created by user on 08/06/2023.
//

import SwiftUI

struct ReservationView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) private var presentationMode
    
    @FetchRequest(sortDescriptors: [
            SortDescriptor(\.firstName)
        ]
    ) var users: FetchedResults<User>
    
    
    var body: some View {
        List {
            ForEach(users, id: \.self) { user in
                VStack(alignment: .leading) {
                    Text("First name: \(user.firstName!)\nLast name: \(user.lastName!)\nEmail: \(user.email!)\nBook title: \(user.book!.title!)\nFrom: \(user.book!.library!.name!)")
                }
            }
            .onDelete(perform: deleteUser(at:))
            if users.count == 0 {
                Text("No reservation.. yet!")
            }
        }
        .padding()
        .navigationTitle("Reseravations")
        .contentShape(Rectangle())
        .navigationBarBackButtonHidden(true)
        .gesture(DragGesture().onEnded{ gesture in
            if gesture.translation.width > 100 {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
    
    func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            let user = users[index]
            context.delete(user)
        }
        try? context.save()
    }
    }
