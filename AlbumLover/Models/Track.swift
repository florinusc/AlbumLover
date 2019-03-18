//
//  Track.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 18/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct Track {
    var name: String
    var duration: String

    static func from(_ trackResource: TrackResource) -> Track {
        return Track(name: trackResource.name, duration: trackResource.duration)
    }
}
