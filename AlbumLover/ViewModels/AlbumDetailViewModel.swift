//
//  AlbumDetailViewModel.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class AlbumDetailViewModel {
    private var albumName: String!
    private var artistName: String!
    private var repository: Repository!
    private var albumDetails: AlbumDetail?

    init(with albumName: String, _ artistName: String, repository: Repository = OfflineRepository()) {
        self.albumName = albumName
        self.artistName = artistName
        self.repository = repository
    }

    func getAlbumDetails(completion block: @escaping (Error?) -> Void) {
        repository.getAlbumDetails(with: albumName, artistName: artistName) { [weak self] albumDetails, error in
            guard error == nil else {
                block(error!)
                return
            }
            guard let strongSelf = self,
                let albumDetails = albumDetails else {
                block(CustomError.generalError)
                return
            }
            strongSelf.albumDetails = albumDetails
            block(nil)
        }
    }

    func getAlbumName() -> String {
        guard let albumDetails = albumDetails else { return "" }
        return albumDetails.name
    }

    func getArtistName() -> String {
        guard let albumDetails = albumDetails else { return "" }
        return albumDetails.artist
    }

    func imageURL() -> URL? {
        guard let albumDetails = albumDetails else { return nil }
        guard let firstImage = albumDetails.imageURLs.last else { return nil }
        return URL(string: firstImage)
    }

    func numberOfTracks() -> Int {
        guard let albumDetails = albumDetails else { return 0 }
        return albumDetails.tracks.count
    }

    func trackDetails(at indexPath: IndexPath) -> String {
        guard let albumDetails = albumDetails,
            indexPath.row < albumDetails.tracks.count else { return "" }
        let track = albumDetails.tracks[indexPath.row]
        return "\(track.duration) - \(track.name)"
    }
}
