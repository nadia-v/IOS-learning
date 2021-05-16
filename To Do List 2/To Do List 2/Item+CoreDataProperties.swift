//
//  Item+CoreDataProperties.swift
//  To Do List 2
//
//  Created by Nadia Vedeneyeva on 5/7/21.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var title: String?

}

extension Item : Identifiable {

}
