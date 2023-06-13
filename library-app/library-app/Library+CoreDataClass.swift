//
//  Library+CoreDataClass.swift
//  library-app
//
//  Created by user on 08/06/2023.
//
//

import Foundation
import CoreData
import CoreLocation

@objc(Library)
public class Library: NSManagedObject {
    public var locationCoordinate: CLLocationCoordinate2D {
        get {
            primitiveLocationCoordinate as? CLLocationCoordinate2D ?? CLLocationCoordinate2D()
        }
        set {
            primitiveLocationCoordinate = newValue as NSObject
        }
    }
}
