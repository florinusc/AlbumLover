//
//  Repository.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

protocol Repository {
    func getAlbums(completion block: @escaping ([Album]?, Error?) -> Void)
    func getArtist(with name: String, completion block: @escaping ([Artist]?, Error?) -> Void)
}
