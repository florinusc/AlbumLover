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
    var normalImageURL: String
    var highImageURL: String
    var tracks: [Track]

    static func from(_ albumDetailResource: AlbumDetailResource) -> AlbumDetail {
        return AlbumDetail(name: albumDetailResource.name,
                           artist: albumDetailResource.artist,
                           normalImageURL: albumDetailResource.image.first(where: { $0.size == "large" })?.stringURL ?? "",
                           highImageURL: albumDetailResource.image.first(where: { $0.size == "extralarge" })?.stringURL ?? "",
                           tracks: albumDetailResource.tracks.track.compactMap({ Track.from($0) }))
    }
}
