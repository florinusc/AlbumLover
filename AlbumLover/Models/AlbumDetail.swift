//
//  AlbumDetail.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct AlbumDetail {
    var name: String
    var artist: String
    var id: String
    var imageURLs: [String]
    var tracks: [Track]
}

struct Track {
    var name: String
    var duration: String
}
