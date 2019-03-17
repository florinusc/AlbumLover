//
//  \.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

public enum CustomError: Error {
    case generalError
    case invalidURLError
    case networkError
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .generalError:
            return NSLocalizedString("Oops, something went wrong, please try again", comment: "General Error")
        case .invalidURLError:
            return NSLocalizedString("The URL is invalid", comment: "Invalid URL")
        case .networkError:
            return NSLocalizedString("There was a network error", comment: "Network Error")
        }
    }
}
