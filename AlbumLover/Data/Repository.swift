//
//  Repository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol Repository {
    func getAlbums(with artistID: String?, completion block: @escaping ([Album]?, Error?) -> Void)
    func getArtists(with name: String, completion block: @escaping ([Artist]?, Error?) -> Void)
    func getAlbumDetails(with albumName: String, artistName: String, completion block: @escaping (AlbumDetail?, Error?) -> Void)
    func addAlbum(albumDetail: AlbumDetail, completion block: @escaping (Error?) -> Void)
    func removeAlbum(albumDetail: AlbumDetail, completion block: @escaping (Error?) -> Void)
    func checkAlbum(albumDetail: AlbumDetail, completion block: @escaping (Bool?, Error?) -> Void)
}

extension Repository {
    func getArtists(with _: String, completion block: @escaping ([Artist]?, Error?) -> Void) {
        block(nil, CustomError.generalError)
    }

    func addAlbum(albumDetail: AlbumDetail, completion block: @escaping (Error?) -> Void) {
        let album = AlbumDataObject(context: CoreDataManager.context)

        album.name = albumDetail.name
        album.artist = albumDetail.artist
        album.normalImageURL = albumDetail.normalImageURL
        album.highImageURL = albumDetail.highImageURL

        albumDetail.tracks.forEach {
            let track = TrackDataObject(context: CoreDataManager.context)
            track.name = $0.name
            track.duration = $0.duration
            album.addToTracks(track)
        }

        CoreDataManager.addAlbum(album) { error in
            block(error)
        }
    }

    func removeAlbum(albumDetail: AlbumDetail, completion block: @escaping (Error?) -> Void) {
        CoreDataManager.removeAlbum(with: albumDetail) { error in
            block(error)
        }
    }

    func checkAlbum(albumDetail: AlbumDetail, completion block: @escaping (Bool?, Error?) -> Void) {
        CoreDataManager.checkAlbum(with: albumDetail) { result, error in
            block(result, error)
        }
    }
}
