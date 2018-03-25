//
//  CoreDataService.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import CoreData

class CoreDataService {
    
    // Singleton
    static let shared = CoreDataService()
    
    
    // MARK: - Core Data stack    
    lazy var managedObjectContext: NSManagedObjectContext = {
        return self.persistentContainer.viewContext
    }()
    
    
    
    
    var childContext: NSManagedObjectContext {
        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.parent = managedObjectContext
        return context
    }
    
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Contacts")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    
    
    
    func performAndSave(block: @escaping (NSManagedObjectContext) -> ()) {
        managedObjectContext.performAndSaveChanges(block: block)
    }
    
    
    
    func delete(object: NSManagedObject) {
        performAndSave { context in
            context.delete(object)
        }
    }
    
    
    
    func fetchedResultsController<EntityType: NSFetchRequestResult>(sortDescriptors: [NSSortDescriptor]?, predicate: NSPredicate? = nil) -> NSFetchedResultsController<EntityType> {
        let fetchRequest = NSFetchRequest<EntityType>(entityName: String(describing: EntityType.self))
        fetchRequest.sortDescriptors = sortDescriptors
        fetchRequest.predicate = predicate
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataService.shared.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultsController
    }

    
    
    // MARK: -Private
    private init() {}
}
