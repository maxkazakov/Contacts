//
//  ContactViewCell.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import UIKit

class ContactViewCell: UITableViewCell {
    static let identifier = String(describing: ContactViewCell.self)
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    func setup(name: String) {
        nameLabel.text = name
    }
}
