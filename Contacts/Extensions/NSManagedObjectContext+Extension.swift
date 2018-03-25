//
//  NSManagedObjectContext+Extension.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    
    func saveOrRollback() -> Bool {
        do {
            try save()
            return true
        } catch {
            print("error save. \(error)")
            rollback()
            return false
        }
    }
    
    
    
    func performAndSaveChanges(block: @escaping (NSManagedObjectContext) -> ()) {
        perform {
            block(self)
            _ = self.saveOrRollback()
        }
    }
}
