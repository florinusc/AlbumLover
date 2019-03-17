//
//  SearchViewModel.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class SearchViewModel {
    private var artists = [Artist]()
    private var repository: Repository!

    init(with repository: Repository = OfflineRepository()) {
        self.repository = repository
    }

    func getArtists(with name: String, completion block: @escaping (Error?) -> Void) {
        repository.getArtists(with: name) { [weak self] artists, error in
            guard error == nil else {
                block(error!)
                return
            }
            guard let strongSelf = self,
                let artists = artists else {
                block(CustomError.generalError)
                return
            }
            strongSelf.artists = artists
            block(nil)
        }
    }

    func numberOfArtists() -> Int {
        return artists.count
    }

    func artist(at indexPath: IndexPath) -> Artist {
        return artists[indexPath.row]
    }

    func artistName(at indexPath: IndexPath) -> String {
        guard indexPath.row < artists.count else { return "" }
        return artists[indexPath.row].name
    }
}
