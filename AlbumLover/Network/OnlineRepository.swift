//
//  OnlineRepository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class OnlineRepository: Repository {
    func getAlbums(completion _: @escaping ([Album]?, Error?) -> Void) {}
    func getArtists(with _: String, completion _: @escaping ([Artist]?, Error?) -> Void) {}
    func getAlbums(by _: String, completion _: @escaping ([Album]?, Error?) -> Void) {}
    func getAlbumDetails(with _: String, by _: String, completion _: @escaping (AlbumDetail?, Error?) -> Void) {}
}
