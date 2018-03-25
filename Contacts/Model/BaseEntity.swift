//
//  BaseEntity.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import Foundation
import CoreData


protocol BaseEntity {
    init(within context: NSManagedObjectContext)
}



extension BaseEntity {
    init(within context: NSManagedObjectContext) {
        self = NSEntityDescription.insertNewObject(forEntityName: "\(Self.self)", into: context) as! Self
    }
}
