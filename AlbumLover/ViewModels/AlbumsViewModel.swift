//
//  FavoriteAlbumsViewModel.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class AlbumsViewModel {
    private var repository: Repository?
    private var albums: [Album] = []
    private var artist: Artist?

    init(with repository: Repository = OfflineRepository(), artist: Artist? = nil) {
        self.repository = repository
        self.artist = artist
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

    func getTitle() -> String {
        if let artist = artist {
            return artist.name
        }
        return repository is OfflineRepository ? "Favorite Albums" : ""
    }

    func shouldShowSearchButton() -> Bool {
        return artist == nil
    }
}
