//
//  UIViewController+Extension.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.black, forKey: "titleTextColor")
        alert.addAction(okAction)

        present(alert, animated: true, completion: nil)
    }
}
