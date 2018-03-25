//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import UIKit
import CoreData


enum ContactField: String {
    case firstName = "First name"
    case lastName = "Last name"
    case phone = "Phone"
    case line1 = "Line 1"
    case line2 = "Line 2"
    case city = "City"
    case state = "State"
    case zipcode = "Zipcode"
    
    
    func value(for viewModel: ContactViewModel) -> String {
        switch self {
        case .firstName:
            return viewModel.firstName
        case .lastName:
            return viewModel.lastName
        case .phone:
            return viewModel.phoneNumber
        case .line1:
            return viewModel.addressLine1
        case .line2:
            return viewModel.addressLine2
        case .city:
            return viewModel.city
        case .state:
            return viewModel.state
        case .zipcode:
            return viewModel.zipCode
        }
    }
}



class ContactDetailsViewController: UITableViewController {    
    
    let presenter = ContactDetailsPresenter()
    var contactViewModel = ContactViewModel.zero
    
    
    
    func setup(viewModel: ContactViewModel, objectId: NSManagedObjectID) {
        contactViewModel = viewModel
        presenter.setup(id: objectId)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = contactViewModel.fullName.isEmpty ? "New contact" : contactViewModel.fullName
        tableView.allowsSelection = false
    }

    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldDescriptions.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = fieldDescriptions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactFieldViewCell.identifier) as! ContactFieldViewCell
        cell.setup(fieldName: field.rawValue, value: field.value(for: contactViewModel))
        return cell
    }
    
    
    
    @IBAction func onSave(_ sender: Any) {
        
        let valueForField: (ContactField) -> String = { field in
            guard let rowIdx = self.fieldDescriptions.index(of: field) else { return "" }
            let indexPath = IndexPath(row: rowIdx, section: 0)
            guard let cell = self.tableView.cellForRow(at: indexPath) as? ContactFieldViewCell else { return "" }
            return cell.value
        }
        
        let contact = ContactViewModel(
            addressLine1: valueForField(.line1),
            addressLine2: valueForField(.line2),
            city: valueForField(.city),
            firstName: valueForField(.firstName),
            lastName: valueForField(.lastName),
            phoneNumber: valueForField(.phone),
            state: valueForField(.state),
            zipCode: valueForField(.zipcode))
        
        presenter.save(contact)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func onCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    private let fieldDescriptions: [ContactField] = [.firstName, .lastName, .phone, .line1, .line2, .city, .state, .zipcode]
}
