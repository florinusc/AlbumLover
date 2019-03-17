//
//  JSONError.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

struct JSONError: Codable, Error {
    var error: Int
    var message: String
}

extension JSONError: LocalizedError {
    public var errorDescription: String? {
        return NSLocalizedString(message, comment: "Error")
    }
}
