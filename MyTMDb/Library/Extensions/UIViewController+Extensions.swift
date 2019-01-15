//
//  UIViewController.swift
//  MyTMDb
//
//  Created by José Victor Pereira Costa on 12/01/19.
//  Copyright © 2019 José Victor Pereira Costa. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(withTitle title: String, andText text: String) -> Void {
        let alert = UIAlertController(title: title, message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
