//
//  Artist.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct ArtistResource: Codable {
    var id: String
    var name: String

    enum CodingKeys: String, CodingKey {
        case id = "mbid"
        case name
    }
}

struct ArtistResources: Codable {
    var results: Results

    struct Results: Codable {
        var artistmatches: Matches
    }

    struct Matches: Codable {
        var artist: [ArtistResource]
    }
}
