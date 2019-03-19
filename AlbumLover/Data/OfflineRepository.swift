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
        CoreDataManager.getAlbums { albums, error in
            block(albums, error)
        }
    }

    func getAlbumDetails(with _: String, artistName _: String, completion block: @escaping (AlbumDetail?, Error?) -> Void) {
        let track = Track(name: "The Power", duration: "423")
        let albumDetail = AlbumDetail(name: "Believe", artist: "Cher", imageURL: "https://lastfm-img2.akamaized.net/i/u/300x300/3b54885952161aaea4ce2965b2db1638.png", tracks: [track])
        block(albumDetail, nil)
    }
}
