//
//  Album.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct AlbumResource: Codable {
    var id: String
    var name: String
    var artist: ArtistResource
    var images: [ImageResource]

    enum CodingKeys: String, CodingKey {
        case id = "mbid"
        case name
        case artist
        case images = "image"
    }
}
