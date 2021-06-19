//
//  UIViewController+Alert.swift
//  marvel-app
//
//  Created by Ruben Marquez on 19/06/2021.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(message: String, title: String = "error".localize) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "ok".localize, style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
