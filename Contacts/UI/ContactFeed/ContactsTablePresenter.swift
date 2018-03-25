//
//  ContactsTablePresenter.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import Foundation
import CoreData


class ContactsTablePresenter {
    
    
    var contactsCount: Int {
        guard let section = fetchController.sections?[0] else { return 0 }
        return section.numberOfObjects
    }
    
    
    
    func observe(observer: NSFetchedResultsControllerDelegate) {
        do {
            try fetchController.performFetch()
            fetchController.delegate = observer
        }
        catch {
            print(error)
        }
    }
    
    
    
    func getContact(by indexPath: IndexPath) -> ContactViewModel {
        let contactModel = fetchController.object(at: indexPath)
        return contactModel.viewModel
    }
    
    
    
    func getObjectId(by indexPath: IndexPath) -> NSManagedObjectID {
        let contactModel = fetchController.object(at: indexPath)
        return contactModel.objectID
    }
    
    
    
    func delete(indexPath: IndexPath) {
        let contact = fetchController.object(at: indexPath)        
        CoreDataService.shared.delete(object: contact)
    }
    
    
    
    init(){
        fetchController = CoreDataService.shared.fetchedResultsController(sortDescriptors: [NSSortDescriptor(key: "firstName", ascending: true)])
    }
    
    
    // MARK: -Private
    private var fetchController: NSFetchedResultsController<Contact>
    private weak var delegate: NSFetchedResultsControllerDelegate?
}

