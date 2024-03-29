//
//  AlbumDetailViewController.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import DZNEmptyDataSet
import UIKit

class AlbumDetailViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var albumNameLabel: UILabel!
    @IBOutlet private var artistNameLabel: UILabel!
    @IBOutlet private var heartButton: UIButton!
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.emptyDataSetSource = self
            tableView.emptyDataSetDelegate = self
            tableView.tableFooterView = UIView()
        }
    }

    var viewModel: AlbumDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        viewModel.saveButtonUpdateHandler = updateSaveButton
        viewModel.getAlbumDetails { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(for: error)
                return
            }
            strongSelf.loadDetails()
        }
    }

    private func loadDetails() {
        albumNameLabel.text = viewModel.getAlbumName()
        artistNameLabel.text = viewModel.getArtistName()
        tableView.reloadData()
        guard let placeholderImage = UIImage(named: Constants.albumPlaceholderImageName) else { return }
        guard let imageURL = viewModel.imageURL() else {
            imageView.image = placeholderImage
            return
        }
        imageView.setImage(with: imageURL, placeholder: placeholderImage)
    }

    private func saveAlbum() {
        viewModel.addAlbumLocally { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(for: error)
                return
            }
        }
    }

    private func removeAlbum() {
        viewModel.removeAlbumFromLocalStorage { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(for: error)
                return
            }
        }
    }

    private func updateSaveButton(saved: Bool) {
        heartButton.setImage(UIImage(named: saved ? Constants.heartFullImageName : Constants.heartEmptyImageName), for: .normal)
    }

    @IBAction private func onCloseButtonTapped(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func onHeartButtonTapped(_: UIButton) {
        viewModel.isAlbumSaved() ? removeAlbum() : saveAlbum()
    }
}

extension AlbumDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.numberOfTracks()
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.trackDetails(at: indexPath)
        return cell
    }
}

extension AlbumDetailViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func description(forEmptyDataSet _: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: viewModel.descriptionForEmptyTracksTable())
    }
}

extension AlbumDetailViewController: Storyboarded, ViewModelBased {
    static var storyboardName: Storyboards { return .main }
}
