//
//  ContactFieldViewCell.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import UIKit

class ContactFieldViewCell: UITableViewCell {
    
    static let identifier = String(describing: ContactFieldViewCell.self)
    
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!
    
    
    
    func setup(fieldName: String, value: String) {
        fieldNameLabel.text = fieldName
        valueTextField.text = value
    }

    
    
    var value: String {
        return valueTextField.text ?? ""
    }
}
