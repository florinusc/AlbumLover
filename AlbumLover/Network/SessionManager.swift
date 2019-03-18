//
//  SessionManager.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import Alamofire
import Foundation

class SessionManager {
    static let shared = SessionManager()
    private static let sharedInstance: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        return Alamofire.SessionManager(configuration: configuration)
    }()

    static func getResources<T: Codable>(type _: T.Type, requestType: RequestType, completion block: @escaping (T?, Error?) -> Void) {
        guard let url = requestType.url else {
            block(nil, CustomError.invalidURLError)
            return
        }
        sharedInstance.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case let .failure(error):
                    block(nil, error)
                case .success:
                    guard let statusCode = response.response?.statusCode,
                        let data = response.data else {
                        block(nil, CustomError.networkError)
                        return
                    }
                    if statusCode < 400 {
                        do {
                            let resources = try JSONDecoder().decode(T.self, from: data)
                            block(resources, nil)
                        } catch let error {
                            print(error)
                            do {
                                let error = try JSONDecoder().decode(JSONError.self, from: data)
                                block(nil, error)
                            } catch {
                                block(nil, error)
                            }
                        }
                    } else {
                        do {
                            let error = try JSONDecoder().decode(JSONError.self, from: data)
                            block(nil, error)
                        } catch let error {
                            block(nil, error)
                        }
                        block(nil, CustomError.networkError)
                        return
                    }
                }
            })
    }
}
