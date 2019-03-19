//
//  CoreDataManager.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 19/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import CoreData
import UIKit

class CoreDataManager {
    static func addAlbum(with albumDetail: AlbumDetail, completion block: @escaping (Error?) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let album = AlbumDataObject(context: context)

        album.name = albumDetail.name
        album.artist = albumDetail.artist
        album.imageURL = albumDetail.imageURL

        albumDetail.tracks.forEach {
            let track = TrackDataObject(context: context)
            track.name = $0.name
            track.duration = $0.duration
            album.addToTracks(track)
        }

        do {
            try context.save()
            block(nil)
        } catch {
            print("Failed saving")
            block(CustomError.coreDataSaveError)
        }
    }

    static func removeAlbum(with albumDetail: AlbumDetail, completion block: @escaping (Error?) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumDataObject")
        request.predicate = NSPredicate(format: "name = %@", albumDetail.name)

        do {
            let objects = try context.fetch(request)
            let objectToDelete = objects.first as! NSManagedObject
            context.delete(objectToDelete)
            try context.save()
        } catch {
            print("Failed to remove from Core Data")
            block(CustomError.coreDataRemoveError)
        }
    }

    static func getAlbums(completion block: @escaping ([Album]?, Error?) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumDataObject")

        do {
            let result = try context.fetch(request)
            let albums = result.compactMap({ Album.from($0 as! AlbumDataObject) })
            block(albums, nil)
        } catch {
            print("Failed to retrieve from Core Data")
            block(nil, CustomError.coreDataRetrieveError)
        }
    }
}
