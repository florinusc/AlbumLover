//
//  ViewController.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class FavoriteAlbumsViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }

    var viewModel: FavoriteAlbumsViewModel?
}

extension FavoriteAlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return 0
    }

    func collectionView(_: UICollectionView, cellForItemAt _: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension FavoriteAlbumsViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
