//
//  RequestType.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Foundation

enum RequestType {
    case albums(artistID: String?)

    var url: URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "ws.audioscrobbler.com"
        components.path = "/2.0"
        components.queryItems = [URLQueryItem(name: "api_key", value: "bfd53bf8f256446203ae1a76eb2645d5"),
                                 URLQueryItem(name: "format", value: "json")]
        switch self {
        case let .albums(artistID):
            components.queryItems?.append(URLQueryItem(name: "method", value: "artist.gettopalbums"))
            if let artistID = artistID {
                components.queryItems?.append(URLQueryItem(name: "mbid", value: artistID))
            }
        }
        return components.url
    }
}
