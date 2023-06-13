//
//  Book+CoreDataProperties.swift
//  library-app
//
//  Created by user on 08/06/2023.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var title: String?
    @NSManaged public var author: String?
    @NSManaged public var library: Library?
    @NSManaged public var user: User?

}

extension Book : Identifiable {

}
