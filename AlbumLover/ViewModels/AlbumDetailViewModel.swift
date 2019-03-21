//
//  AlbumDetailViewModel.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

class AlbumDetailViewModel: ViewModel {
    private var albumName: String!
    private var artistName: String!
    private var repository: Repository!
    private var albumDetails: AlbumDetail?
    private var isSaved: Bool! {
        didSet { saveButtonUpdateHandler(isSaved) }
    }

    var saveButtonUpdateHandler: (Bool) -> Void = { _ in }

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
            strongSelf.checkIfAlbumIsSaved()
            block(nil)
        }
    }

    private func checkIfAlbumIsSaved() {
        guard isSaved == nil else { return }
        guard let albumDetail = albumDetails else { return }
        repository.checkAlbum(albumDetail: albumDetail) { [weak self] result, error in
            guard error == nil,
                let result = result,
                let strongSelf = self else {
                return
            }
            strongSelf.isSaved = result
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
        return URL(string: albumDetails.highImageURL)
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

    func addAlbumLocally(completion block: @escaping (Error?) -> Void) {
        guard let albumDetail = albumDetails else { return }
        repository.addAlbum(albumDetail: albumDetail) { [weak self] error in
            if error == nil, let strongSelf = self {
                strongSelf.isSaved = true
            }
            block(error)
        }
    }

    func removeAlbumFromLocalStorage(completion block: @escaping (Error?) -> Void) {
        guard let albumDetail = albumDetails else { return }
        repository.removeAlbum(albumDetail: albumDetail) { [weak self] error in
            if error == nil, let strongSelf = self {
                strongSelf.isSaved = false
            }
            block(error)
        }
    }

    func isAlbumSaved() -> Bool {
        return isSaved
    }

    func descriptionForEmptyTracksTable() -> String {
        return "We couldn't find any tracks for this album"
    }
}
