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
    case artists(name: String)
    case albumDetails(albumName: String, artistName: String)

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
        case let .artists(name):
            components.queryItems?.append(URLQueryItem(name: "method", value: "artist.search"))
            components.queryItems?.append(URLQueryItem(name: "artist", value: name))
        case let .albumDetails(albumName, artistName):
            components.queryItems?.append(URLQueryItem(name: "method", value: "album.getinfo"))
            components.queryItems?.append(URLQueryItem(name: "album", value: albumName))
            components.queryItems?.append(URLQueryItem(name: "artist", value: artistName))
        }
        return components.url
    }
}