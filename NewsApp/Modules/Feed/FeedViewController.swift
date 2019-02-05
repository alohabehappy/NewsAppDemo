//
//  FeedViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
	
	let provider = FeedProvider()
	
	@IBOutlet weak var tableView: UITableView!
	lazy var tableAdapter = FeedTableAdapter()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		tableAdapter.connect(tableView: tableView, items: [], delegate: self)
		reloadData()
    }
	
	private func reloadData() {
		showHUD()
		provider.fetchHubs { [weak self] (hubs, error) in
			self?.hideHUD()
			if let error = error {
				self?.showErrorAlert(message: error.localizedDescription)
				return
			}
			
			let viewModels = hubs.map { HubViewModel(entity: $0) }
			self?.tableAdapter.update(items: viewModels)
		}
	}

}

// MARK: - FeedTableAdapterDelegate
extension FeedViewController: FeedTableAdapterDelegate {
	
	func didSelectItem(_ item: HubViewModel) {
		print(#function)
	}
	
}
