//
//  OnlineRepository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class OnlineRepository: Repository {
    func getAlbums(with artistID: String?, completion _: @escaping ([Album]?, Error?) -> Void) {}
    func getArtists(with _: String, completion _: @escaping ([Artist]?, Error?) -> Void) {}
    func getAlbumDetails(with albumID: String, completion _: @escaping (AlbumDetail?, Error?) -> Void) {}
}
