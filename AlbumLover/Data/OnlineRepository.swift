//
//  OnlineRepository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class OnlineRepository: Repository {
    func getAlbums(with artistID: String?, completion block: @escaping ([Album]?, Error?) -> Void) {
        SessionManager.getResources(type: AlbumResource.self, requestType: .albums(artistID: artistID)) { albums, error in
            guard error == nil else {
                block(nil, error!)
                return
            }
            block(albums?.compactMap({ Album.from($0) }), nil)
        }
    }

    func getArtists(with _: String, completion _: @escaping ([Artist]?, Error?) -> Void) {}
    func getAlbumDetails(with albumID: String, completion _: @escaping (AlbumDetail?, Error?) -> Void) {}
}
