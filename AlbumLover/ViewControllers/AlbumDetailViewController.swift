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
    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    var viewModel: AlbumDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AlbumDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 0
    }

    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}

extension AlbumDetailViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
