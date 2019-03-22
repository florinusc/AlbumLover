//
//  ViewController.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import DZNEmptyDataSet
import UIKit

class AlbumsViewController: UIViewController {
    @IBOutlet private var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.emptyDataSetSource = self
            collectionView.emptyDataSetDelegate = self
            collectionView.register(AlbumCollectionViewCell.self)
        }
    }

    var viewModel: AlbumsViewModel!

    private let cellAspectRatio: CGFloat = 1.45
    private let numberOfCellsPerRow: CGFloat = 2.0
    private let cellPadding: CGFloat = 30.0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }

    private func setup() {
        setupNavBar()
        viewModel?.getAlbums(completion: { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(for: error)
                return
            }
            strongSelf.collectionView.reloadData()
        })
    }

    private func setupNavBar() {
        title = viewModel.title()
        guard viewModel.shouldShowSearchButton() else { return }
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(goToSearch))
        navigationItem.rightBarButtonItem = searchButton
        navigationItem.hideBackButtonText()
    }

    @objc private func goToSearch() {
        let searchViewController = SearchViewController.instantiate(with: SearchViewModel())
        navigationController?.pushViewController(searchViewController, animated: true)
    }

    private func goToAlbumDetail(with indexPath: IndexPath) {
        guard let albumDetailViewModel = viewModel.albumDetailViewModel(at: indexPath) else { return }
        let albumDetailViewController = AlbumDetailViewController.instantiate(with: albumDetailViewModel)
        navigationController?.present(albumDetailViewController, animated: true, completion: nil)
    }
}

extension AlbumsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return viewModel.numberOfAlbums()
    }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        viewModel.albumViewModel(at: indexPath) { albumViewModel in
            guard let albumViewModel = albumViewModel else { return }
            cell.configure(with: albumViewModel)
        }
        return cell
    }

    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goToAlbumDetail(with: indexPath)
    }
}

extension AlbumsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - cellPadding) / numberOfCellsPerRow
        let height = width * cellAspectRatio
        return CGSize(width: width, height: height)
    }
}

extension AlbumsViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func title(forEmptyDataSet _: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: viewModel.titleForEmptyDataSet())
    }

    func description(forEmptyDataSet _: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: viewModel.descriptionForEmptyDataSet())
    }
}

extension AlbumsViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
