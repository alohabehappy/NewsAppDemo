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
	
	lazy var refreshControl: UIRefreshControl = {
		let refreshControl = UIRefreshControl()
		refreshControl.addTarget(self,
								 action: #selector(handleRefresh(_:)),
								 for: .valueChanged)
		return refreshControl
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		setupTableView()
		reloadData()
    }
	
	private func setupTableView() {
		tableView.addSubview(refreshControl)
		tableAdapter.connect(tableView: tableView, items: [], delegate: self)
	}
	
	private func reloadData() {
		refreshControl.beginRefreshing()
		
		provider.fetchHubs { [weak self] (hubs, error) in
			self?.refreshControl.endRefreshing()
			
			if let error = error {
				self?.showErrorAlert(message: error.localizedDescription)
				return
			}
			
			let viewModels = hubs.map { HubViewModel(entity: $0) }
			self?.tableAdapter.update(items: viewModels)
		}
	}

	@objc func handleRefresh(_ refreshControl: UIRefreshControl) {
		reloadData()
	}
	
}

// MARK: - FeedTableAdapterDelegate
extension FeedViewController: FeedTableAdapterDelegate {
	
	func didSelectItem(_ item: HubViewModel) {
		print(#function)
	}
	
	func didLongPressItem(_ item: HubViewModel) {
		print(#function)
	}
	
}
