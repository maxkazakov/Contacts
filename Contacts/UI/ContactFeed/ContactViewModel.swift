//
//  ContactViewModel.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import Foundation


struct ContactViewModel {
    var addressLine1: String = ""
    var addressLine2: String = ""
    var city: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var state: String = ""
    var zipCode: String = ""
    
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    
    static let zero = ContactViewModel()
}
