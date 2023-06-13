//
//  DataSeeder.swift
//  library-app
//
//  Created by user on 10/06/2023.
//

import Foundation
import CoreLocation

class DataSeeder {
    static func seedData(){
        let context = PersistenceController.shared.context
        
        let libraryA = Library(context: context)
        libraryA.name = "Hieronim Łopaciński Provincial Public Library"
        libraryA.address = "Gabriela Narutowicza 4"
        libraryA.locationCoordinate = CLLocationCoordinate2D(latitude: 51.24677, longitude: 22.56336)
        
        let libraryB = Library(context: context)
        libraryB.name = "UMCS Main Library"
        libraryB.address = "Idziego Radziszowskiego 11"
        libraryB.locationCoordinate = CLLocationCoordinate2D(latitude: 51.24658, longitude: 22.54154)
        
        let bookA1 = Book(context: context)
        bookA1.title = "Title of Book 1"
        bookA1.author = "Author A1"
        bookA1.library = libraryA
        
        let bookA2 = Book(context: context)
        bookA2.title = "Title of Book 2"
        bookA2.author = "Author A2"
        bookA2.library = libraryA
        
        let bookA3 = Book(context: context)
        bookA3.title = "Title of Book 3"
        bookA3.author = "Author A3"
        bookA3.library = libraryA
        
        let bookB1 = Book(context: context)
        bookB1.title = "Title of Book 1"
        bookB1.author = "Author B1"
        bookB1.library = libraryB
        
        let bookB2 = Book(context: context)
        bookB2.title = "Title of Book 2"
        bookB2.author = "Author B2"
        bookB2.library = libraryB
        
        let bookB3 = Book(context: context)
        bookB3.title = "Title of Book 3"
        bookB3.author = "Author B3"
        bookB3.library = libraryB
        
//        PersistenceController.shared.saveContext()
    }
}
