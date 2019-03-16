//
//  SearchViewController.swift
//  AlbumLover
//
//  Created by Florin Uscatu on 16/03/2019.
//  Copyright © 2019 Florin Uscatu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet private var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
            searchBar.placeholder = "Search for artist"
        }
    }

    @IBOutlet private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.tableFooterView = UIView()
        }
    }

    var viewModel: SearchViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        title = "Search"
    }

    private func filterContentForSearchText(text: String) {
        viewModel?.getArtists(with: text.lowercased(), completion: { [weak self] error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.presentAlert(with: "Error", message: error?.localizedDescription ?? "Something went wrong")
                return
            }
            strongSelf.tableView.reloadData()
        })
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return viewModel?.numberOfArtists() ?? 0
    }

    func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel?.artistName(at: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        filterContentForSearchText(text: text)
        searchBar.resignFirstResponder()
    }
}

extension SearchViewController: Storyboarded {
    static var storyboardName: String {
        return "Main"
    }
}
