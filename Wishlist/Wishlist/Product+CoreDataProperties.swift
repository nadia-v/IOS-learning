//
//  Product+CoreDataProperties.swift
//  Wishlist
//
//  Created by Nadia Vedeneyeva on 5/13/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var title: String?
    @NSManaged public var store: String?
    @NSManaged public var image: Data?

}

extension Product : Identifiable {

}
