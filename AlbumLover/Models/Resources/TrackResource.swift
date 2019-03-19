//
//  TracklResource.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 19/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct TrackResource: Codable {
    var name: String
    var url: String
    var duration: String
}

struct TrackResources: Codable {
    var track: [TrackResource]
}
