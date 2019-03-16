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
            collectionView.register(AlbumCollectionViewCell.self)
        }
    }

    var viewModel: FavoriteAlbumsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        setupNavBar()
        viewModel?.getAlbums(completion: { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(with: "Error", message: error?.localizedDescription ?? "Something went wrong")
                return
            }
            strongSelf.collectionView.reloadData()
        })
    }

    private func setupNavBar() {
        title = viewModel?.getTitle()
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goToSearch))
        navigationItem.rightBarButtonItem = searchButton
    }

    @objc private func goToSearch() {
        let searchViewModel = SearchViewModel()
        let searchViewController = SearchViewController.getInstance()
        searchViewController.viewModel = searchViewModel
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}

extension FavoriteAlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return viewModel?.numberOfAlbums() ?? 0
    }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        if let albumViewModel = viewModel?.albumViewModel(at: indexPath) {
            cell.configure(with: albumViewModel)
        }
        return cell
    }
}

extension FavoriteAlbumsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30.0) / 2.0
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
}

extension FavoriteAlbumsViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
