//
//  OfflineRepository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class OfflineRepository: Repository {
    func getAlbums(completion block: @escaping ([Album]?, Error?) -> Void) {
        block([Album(name: "Greatest Hits", artist: "Cher", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"),
               Album(name: "Graduation", artist: "Kanye", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png")], nil)
    }

    func getArtist(with _: String, completion block: @escaping ([Artist]?, Error?) -> Void) {
        block([Artist(id: "", name: "Cher")], nil)
    }
}
