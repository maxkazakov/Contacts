//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import UIKit
import CoreData


class ContactsTableViewController: UITableViewController {    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        presenter.observe(observer: self)
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.contactsCount
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactViewModel = presenter.getContact(by: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactViewCell.identifier) as! ContactViewCell
        cell.setup(name: contactViewModel.fullName)
        return cell        
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.delete(indexPath: indexPath)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = presenter.getContact(by: indexPath)
        let objectId = presenter.getObjectId(by: indexPath)
        let detailsVc: ContactDetailsViewController = createViewController()        
        detailsVc.setup(viewModel: contact, objectId: objectId)
        present(detailsVc.wrappedToNavigation, animated: true, completion: nil)
    }
    
    
    
    @IBAction func onAddNewContact(_ sender: Any) {
        let detailsVc: ContactDetailsViewController = createViewController()
        present(detailsVc.wrappedToNavigation, animated: true, completion: nil)
    }
    
    
    
    // MARK: -Private
    private let presenter = ContactsTablePresenter()
    
}



extension ContactsTableViewController: NSFetchedResultsControllerDelegate{
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {        
        switch type {

        case .insert:
            guard let path = newIndexPath else {
                return
            }
            tableView.insertRows(at: [path], with: .automatic)

        case .update:
            guard let path = newIndexPath else {
                return
            }
            tableView.reloadRows(at: [path], with: .automatic)

        case .delete:
            guard let path = indexPath else {
                return
            }
            tableView.deleteRows(at: [path], with: .automatic)

        case .move:
            guard let oldpath = indexPath, let newpath = newIndexPath else {
                return
            }
            tableView.deleteRows(at: [oldpath], with: .automatic)
            tableView.insertRows(at: [newpath], with: .automatic)
        }
    }


    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}
