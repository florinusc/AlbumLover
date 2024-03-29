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
        CoreDataManager.getAlbums { objects, error in
            guard let objects = objects else {
                block(nil, CustomError.coreDataRetrieveError)
                return
            }
            let albums = objects.compactMap({ Album.from($0) })
            block(albums, error)
        }
    }

    func getAlbumDetails(with albumName: String, artistName: String, completion block: @escaping (AlbumDetail?, Error?) -> Void) {
        CoreDataManager.getAlbum(with: albumName, artist: artistName) { object, error in
            guard error == nil else {
                block(nil, error)
                return
            }
            guard let object = object else {
                block(nil, CustomError.coreDataRetrieveError)
                return
            }
            block(AlbumDetail.from(object), nil)
        }
    }
}
