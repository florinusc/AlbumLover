//
//  Artist.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Artist {
    var id: String?
    var name: String

    static func from(_ artistResource: ArtistResource) -> Artist {
        return Artist(id: artistResource.id, name: artistResource.name)
    }
}
