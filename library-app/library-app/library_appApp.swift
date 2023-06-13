//
//  library_appApp.swift
//  library-app
//
//  Created by user on 08/06/2023.
//

import SwiftUI
import CoreData

@main
struct library_appApp: App {
    let persistenceController = PersistenceController.shared
    @ObservedObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(appState)
        }
    }
    
    init(){
        DataSeeder.seedData()
    }
}
