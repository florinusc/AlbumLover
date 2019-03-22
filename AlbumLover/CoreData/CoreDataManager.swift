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
    static let context: NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()

    static func addAlbum(_: AlbumDataObject, completion block: @escaping (Error?) -> Void) {
        do {
            try context.save()
            block(nil)
        } catch {
            print("Failed saving")
            block(CustomError.coreDataSaveError)
        }
    }

    static func removeAlbum(with name: String, artist: String, completion block: @escaping (Error?) -> Void) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumDataObject")
        request.predicate = NSPredicate(format: "name = %@ AND artist = %@", name, artist)

        do {
            let objects = try context.fetch(request)
            let objectToDelete = objects.first as! NSManagedObject
            context.delete(objectToDelete)
            try context.save()
            block(nil)
        } catch {
            print("Failed to remove from Core Data")
            block(CustomError.coreDataRemoveError)
        }
    }

    static func checkAlbum(with name: String, artist: String, completion block: @escaping (Bool?, Error?) -> Void) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumDataObject")
        request.predicate = NSPredicate(format: "name = %@ AND artist = %@", name, artist)

        do {
            let objects = try context.fetch(request)
            block(objects.count > 0, nil)
        } catch {
            print("Failed to retrieve from Core Data")
            block(nil, CustomError.coreDataRetrieveError)
        }
    }

    static func getAlbums(completion block: @escaping ([AlbumDataObject]?, Error?) -> Void) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumDataObject")

        do {
            let result = try context.fetch(request)
            block(result as? [AlbumDataObject], nil)
        } catch {
            print("Failed to retrieve from Core Data")
            block(nil, CustomError.coreDataRetrieveError)
        }
    }

    static func getAlbum(with name: String, artist: String, completion block: @escaping (AlbumDataObject?, Error?) -> Void) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumDataObject")
        request.predicate = NSPredicate(format: "name = %@ AND artist = %@", name, artist)

        do {
            let result = try context.fetch(request)
            let object = result.first as? AlbumDataObject
            block(object, nil)
        } catch {
            print("Failed to retrieve from Core Data")
            block(nil, CustomError.coreDataRetrieveError)
        }
    }
}
