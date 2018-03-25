//
//  ContactDetailsPresenter.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import CoreData


class ContactDetailsPresenter {
    
    func save(_ viewModel: ContactViewModel) {
        var contact: Contact
        if let id = objectId {
            contact = managedContext.object(with: id) as! Contact
        } else {
            contact = Contact.init(within: managedContext)
        }
        
        contact.set(viewModel: viewModel)
        CoreDataService.shared.performAndSave { _ in
            try? self.managedContext.save()
        }
        
    }
    
    
    
    func setup(id: NSManagedObjectID) {
        objectId = id
    }
    
    
    
    init() {
        managedContext = CoreDataService.shared.childContext
    }
    
    
    
    
    // MARK: -Private
    
    private let managedContext: NSManagedObjectContext
    private var objectId: NSManagedObjectID?
}
