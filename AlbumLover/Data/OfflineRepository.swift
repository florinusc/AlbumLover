//
//  OfflineRepository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class OfflineRepository: Repository {
    func getAlbums(with _: String?, completion block: @escaping ([Album]?, Error?) -> Void) {
        block([Album(name: "Greatest Hits", artist: "Cher", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Glory", artist: "Bono", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12"),
               Album(name: "Graduation", artist: "Kanye", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", id: "12")], nil)
    }

    func getArtists(with _: String, completion block: @escaping ([Artist]?, Error?) -> Void) {
        block([Artist(id: "bfcc6d75-a6a5-4bc6-8282-47aec8531818", name: "Cher")], nil)
    }

    func getAlbumDetails(with _: String, artistName _: String, completion block: @escaping (AlbumDetail?, Error?) -> Void) {
        let track = Track(name: "The Power", duration: "423")
        let albumDetail = AlbumDetail(name: "Believe", artist: "Cher", imageURLs: ["https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png"], tracks: [track])
        block(albumDetail, nil)
    }
}
