//
//  FavoriteAlbumsViewModelTests.swift
//  AlbumLoverTests
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import AlbumLover

class FavoriteAlbumsViewModelTests: XCTestCase {
    
    var favoriteAlbumsViewModel: AlbumsViewModel!
    var favoriteAlbumsViewModelWithError: AlbumsViewModel!
    
    override func setUp() {
        favoriteAlbumsViewModel = AlbumsViewModel.init(with: MockRepository())
        favoriteAlbumsViewModelWithError = AlbumsViewModel.init(with: MockRepository(shouldThrowError: true))
    }
    
    func getAlbums() {
        let exp = expectation(description: "return albums")
        favoriteAlbumsViewModel.getAlbums { (error) in
            exp.fulfill()
        }
        let result = XCTWaiter().wait(for: [exp], timeout: 5.0)
        XCTAssert(result == .completed)
    }
    
    func testNumberOfAlbums_With9Albums_Returns9() {
        getAlbums()
        XCTAssertEqual(favoriteAlbumsViewModel.numberOfAlbums(), 9)
    }
    
    func testAlbumAtIndexPath_With9Albums_ReturnsNotNil() {
        getAlbums()
        XCTAssertNotNil(favoriteAlbumsViewModel.albumViewModel(at: IndexPath(item: 3, section: 0)))
    }
    
    func testGetAlbums_WithNilError_ReturnsNotNil() {
        favoriteAlbumsViewModel.getAlbums { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testGetAlbums_WithError_ReturnsErrorNotNil() {
        favoriteAlbumsViewModelWithError.getAlbums { (error) in
            XCTAssertNotNil(error)
        }
    }
}
