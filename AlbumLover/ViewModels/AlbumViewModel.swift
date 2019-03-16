//
//  AlbumViewModel.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

struct AlbumViewModel {
    var name: String
    var artist: String
    var imageURL: String

    init(with album: Album) {
        name = album.name
        artist = album.artist
        imageURL = album.imageURL
    }
}
