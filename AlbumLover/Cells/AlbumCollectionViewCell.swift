//
//  AlbumCollectionViewCell.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var artistLabel: UILabel!

    func configure(with albumViewModel: AlbumViewModel) {
        nameLabel.text = albumViewModel.name
        artistLabel.text = "by \(albumViewModel.artist)"
        guard let placeholderImage = UIImage(named: Constants.albumPlaceholderImageName) else { return }
        guard let url = URL(string: albumViewModel.imageURL) else {
            imageView.image = placeholderImage
            return
        }
        imageView.setImage(with: url, placeholder: placeholderImage)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = ""
        artistLabel.text = ""
        imageView.image = nil
    }
}
