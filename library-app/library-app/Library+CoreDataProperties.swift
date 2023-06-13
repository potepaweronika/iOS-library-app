//
//  Library+CoreDataProperties.swift
//  library-app
//
//  Created by user on 08/06/2023.
//
//

import Foundation
import CoreData
import CoreLocation

extension Library {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Library> {
        return NSFetchRequest<Library>(entityName: "Library")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var primitiveLocationCoordinate: NSObject?
    @NSManaged public var books: NSSet?

}

// MARK: Generated accessors for books
extension Library {

    @objc(addBooksObject:)
    @NSManaged public func addToBooks(_ value: Book)

    @objc(removeBooksObject:)
    @NSManaged public func removeFromBooks(_ value: Book)

    @objc(addBooks:)
    @NSManaged public func addToBooks(_ values: NSSet)

    @objc(removeBooks:)
    @NSManaged public func removeFromBooks(_ values: NSSet)

}

extension Library : Identifiable {
    
}
