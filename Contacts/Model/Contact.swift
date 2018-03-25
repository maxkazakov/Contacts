//
//  Contact.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//
//

import Foundation
import CoreData


public class Contact: NSManagedObject, BaseEntity {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }
    
    @NSManaged public var addressLine1: String?
    @NSManaged public var addressLine2: String?
    @NSManaged public var city: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var state: String?
    @NSManaged public var zipCode: String?
}
