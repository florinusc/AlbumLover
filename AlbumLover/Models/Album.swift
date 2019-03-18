//
//  Album.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Album {
    var name: String
    var artist: String
    var imageURL: String
    var id: String

    static func from(_ albumResource: AlbumResource) -> Album {
        return Album(name: albumResource.name,
                     artist: albumResource.artist.name,
                     imageURL: albumResource.images.first(where: {$0.size == .large})?.stringURL ?? "",
                     id: albumResource.id ?? "")
    }
}
