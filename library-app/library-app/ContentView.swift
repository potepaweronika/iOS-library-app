//
//  ContentView.swift
//  library-app
//
//  Created by user on 08/06/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var appState: AppState
    
    @FetchRequest(sortDescriptors: [
            SortDescriptor(\.name)
        ]
    ) var libraries: FetchedResults<Library>
    
    @State var selectedLibrary: Library?
    @State private var isLongPressed = false
    @State private var isClicked = false
    
    var body: some View {
        TabView {
        NavigationView {
            List(libraries) { library in
                VStack{
                    HStack(alignment: .top){
                        NavigationLink(destination: Group
                                       {if self.isLongPressed {LibraryDetailView(library: library)} else {LibraryBooksView(library: library)}}, tag: library, selection: self.$selectedLibrary) {Text(library.name ?? "")}
                    }.id(appState.rootViewId)
                }
                .contentShape(Rectangle())
                .simultaneousGesture(LongPressGesture().onEnded{ _ in
                    self.selectedLibrary = library
                    self.isLongPressed = true
                })
                .simultaneousGesture(TapGesture().onEnded{
                    self.selectedLibrary = library
                    self.isLongPressed = false
                })
                .onAppear(){
                    self.isLongPressed = false
                    self.isClicked = false
                }
            }
            .navigationBarTitle("Libraries")
            //            .navigationBarItems(leading: Button(action: {
            //                isClicked = true
            //            }) {
            //                Text("Show Reservations")
            //                    .foregroundColor(.white)
            //                    .padding()
            //                    .cornerRadius(10)
            //            })
            //            NavigationLink(destination: ReservationView(), isActive: $isClicked, label: {EmptyView()})
            
        }
        .tabItem {
            Image(systemName: "magnifyingglass")
            Text("Show Libraries")
        }
        ReservationView().tabItem {
            Image(systemName: "line.horizontal.3")
            Text("Show Reservations")
        }
    }
    }
}
