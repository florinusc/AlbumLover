//
//  UIImageView+Extension.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Alamofire
import AlamofireImage
import Foundation

extension UIImageView {
    func setImage(with url: URL) {
        af_setImage(withURL: url)
    }

    func setImage(with url: URL, placeholder: UIImage) {
        let request: URLRequestConvertible = URLRequest(url: url)
        af_setImage(withURLRequest: request, placeholderImage: placeholder) { response in
            if response.error != nil {
                self.image = placeholder
            }
        }
    }
}
