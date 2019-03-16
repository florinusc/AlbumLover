//
//  AlbumLoverTests.swift
//  AlbumLoverTests
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import XCTest
@testable import AlbumLover

class AlbumViewModelTests: XCTestCase {

    var albumViewModel: AlbumViewModel!
    
    override func setUp() {
        let album = Album(name: "Test", artist: "Test Artist", imageURL: "www.google.com")
        albumViewModel = AlbumViewModel(with: album)
    }
    
    func testAlbumViewModel_hasCorrectName_returnsTrue() {
        XCTAssertTrue(albumViewModel.name == "Test")
    }
    
    func testAlbumViewModel_hasCorrectArtist_returnsTrue() {
        XCTAssertTrue(albumViewModel.artist == "Test Artist")
    }
    
    func testAlbumViewModel_hasCorrectImageURL_returnsTrue() {
        XCTAssertTrue(albumViewModel.imageURL == "www.google.com")
    }

}
