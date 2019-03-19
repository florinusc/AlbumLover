//
//  AlbumDetailResource.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 19/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct AlbumDetailResource: Codable {
    var name: String
    var artist: String
    var image: [ImageResource]
    var tracks: TrackResources

    enum CodingKeys: String, CodingKey {
        case album
        case name
        case artist
        case image
        case tracks
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .album)
        name = try response.decode(String.self, forKey: .name)
        artist = try response.decode(String.self, forKey: .artist)
        image = try response.decode([ImageResource].self, forKey: .image)
        tracks = try response.decode(TrackResources.self, forKey: .tracks)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .album)
        try response.encode(name, forKey: .name)
        try response.encode(artist, forKey: .artist)
        try response.encode(image, forKey: .image)
        try response.encode(tracks, forKey: .tracks)
    }
}
