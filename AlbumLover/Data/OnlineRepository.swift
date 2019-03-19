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
        SessionManager.getResources(type: AlbumResources.self, requestType: .albums(artistID: artistID)) { albumResources, error in
            guard error == nil else {
                block(nil, error!)
                return
            }
            block(albumResources?.topalbums.album.compactMap({ Album.from($0) }), nil)
        }
    }

    func getArtists(with name: String, completion block: @escaping ([Artist]?, Error?) -> Void) {
        SessionManager.getResources(type: ArtistResources.self, requestType: .artists(name: name)) { artistResources, error in
            guard error == nil else {
                block(nil, error!)
                return
            }
            block(artistResources?.results.artistmatches.artist.compactMap({ Artist.from($0) }), nil)
        }
    }

    func getAlbumDetails(with albumName: String, artistName: String, completion block: @escaping (AlbumDetail?, Error?) -> Void) {
        SessionManager.getResources(type: AlbumDetailResource.self, requestType: .albumDetails(albumName: albumName, artistName: artistName)) { albumResource, error in
            guard error == nil else {
                block(nil, error)
                return
            }
            guard let album = albumResource else {
                block(nil, CustomError.generalError)
                return
            }
            block(AlbumDetail.from(album), nil)
        }
    }
}
