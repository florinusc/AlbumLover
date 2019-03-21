//
//  UINavigationItem+Extension.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 21/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

extension UINavigationItem {
    func hideBackButtonText() {
        backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
