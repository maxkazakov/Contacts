//
//  UIViewController+Extension.swift
//  Contacts
//
//  Created by Максим Казаков on 25/03/2018.
//  Copyright © 2018 Максим Казаков. All rights reserved.
//

import UIKit

extension UIViewController {
    func createViewController<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: T.self)) as! T
    }
    
    
    var wrappedToNavigation: UIViewController {
        return UINavigationController(rootViewController: self)
    }
}



