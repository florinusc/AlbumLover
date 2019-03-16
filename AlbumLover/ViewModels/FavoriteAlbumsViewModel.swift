//
//  FavoriteAlbumsViewModel.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class FavoriteAlbumsViewModel {
    private var repository: Repository?
    private var albums: [Album] = []

    init(with repository: Repository = OfflineRepository()) {
        self.repository = repository
    }

    func getAlbums(completion block: @escaping (Error?) -> Void) {
        repository?.getAlbums(completion: { [weak self] albums, error in
            guard error == nil else {
                block(error!)
                return
            }
            guard let strongSelf = self,
                let albums = albums else {
                block(CustomError.generalError)
                return
            }
            strongSelf.albums = albums
            block(nil)
        })
    }

    func numberOfAlbums() -> Int {
        return albums.count
    }

    func albumViewModel(at indexPath: IndexPath) -> AlbumViewModel? {
        guard indexPath.item < albums.count else { return nil }
        let album = albums[indexPath.item]
        return AlbumViewModel(with: album)
    }
}
