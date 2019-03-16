//
//  UIImageView+Extension.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import AlamofireImage
import Foundation

extension UIImageView {
    func setImage(with url: URL) {
        af_setImage(withURL: url)
    }
}
