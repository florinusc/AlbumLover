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
}

extension Repository {
    func addAlbum(albumDetail _: AlbumDetail, completion block: @escaping (Error?) -> Void) {
        block(CustomError.generalError)
    }

    func removeAlbum(albumDetail _: AlbumDetail, completion block: @escaping (Error?) -> Void) {
        block(CustomError.generalError)
    }
}
