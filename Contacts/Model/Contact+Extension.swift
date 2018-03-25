//
//  Contact+Extension.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import CoreData


extension Contact {
    
    var viewModel: ContactViewModel {
        return ContactViewModel(
            addressLine1: addressLine1 ?? "",
            addressLine2: addressLine2 ?? "",
            city: city ?? "",
            firstName: firstName ?? "",
            lastName: lastName ?? "",
            phoneNumber: phoneNumber ?? "",
            state: state ?? "",
            zipCode: zipCode ?? "")
    }
    
    
    
    func set(viewModel: ContactViewModel) {
        addressLine1 = viewModel.addressLine1
        addressLine2 = viewModel.addressLine2
        city = viewModel.city
        firstName = viewModel.firstName
        lastName = viewModel.lastName
        phoneNumber = viewModel.phoneNumber
        state = viewModel.state
        zipCode = viewModel.zipCode
    }
}
