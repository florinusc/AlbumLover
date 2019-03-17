//
//  AlbumDetailViewController.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 17/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

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
            tableView.tableFooterView = UIView()
        }
    }

    var viewModel: AlbumDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        viewModel.getAlbumDetails { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(with: "Error", message: error!.localizedDescription)
                return
            }
            strongSelf.loadDetails()
        }
    }

    private func loadDetails() {
        albumNameLabel.text = viewModel.albumName()
        artistNameLabel.text = viewModel.artistName()
        tableView.reloadData()
        guard let imageURL = viewModel.imageURL() else { return }
        imageView.setImage(with: imageURL)
    }

    @IBAction private func onCloseButtonTapped(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func onHeartButtonTapped(_: UIButton) {}
}

extension AlbumDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel.numberOfTracks()
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.detailTextLabel?.text = viewModel.trackDetails(at: indexPath)
        return cell
    }
}

extension AlbumDetailViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
