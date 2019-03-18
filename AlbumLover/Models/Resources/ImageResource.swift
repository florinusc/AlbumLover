//
//  ImageResource.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct ImageResource: Codable {
    var stringURL: String
    var size: String

    enum CodingKeys: String, CodingKey {
        case stringURL = "#text"
        case size
    }
}
