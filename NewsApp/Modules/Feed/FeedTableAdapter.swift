//
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

protocol FeedTableAdapterDelegate: class {
	func didSelectItem(_ item: HubViewModel)
	func didLongPressItem(_ item: HubViewModel)
}

final class FeedTableAdapter: BaseTableAdapter {
	
	weak var delegate: FeedTableAdapterDelegate?
	private var items: [HubViewModel] = []
	
	func connect(tableView: UITableView,
				 items: [HubViewModel],
				 delegate: FeedTableAdapterDelegate) {
		connect(tableView: tableView)
		self.items = items
		self.delegate = delegate
		
		tableView.register(UINib(nibName: "HubTableViewCell", bundle: nil),
						   forCellReuseIdentifier: HubTableViewCell.identifier)
		tableView.rowHeight = UITableView.automaticDimension
		
		let longPress = UILongPressGestureRecognizer(target: self, action: #selector(tableViewLongPressed(_:)))
		tableView.addGestureRecognizer(longPress)
		
		refresh()
	}
	
	func update(items: [HubViewModel]) {
		self.items = items
		refresh()
	}
	
	// MARK: - UITableViewDataSource
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: HubTableViewCell.identifier, for: indexPath) as! HubTableViewCell
		
		let item = items[indexPath.row]
		cell.configure(with: item)
		return cell
	}
	
	// MARK: - UITableViewDelegate
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		let item = items[indexPath.row]
		delegate?.didSelectItem(item)
	}
	
	@objc func tableViewLongPressed(_ recognizer: UILongPressGestureRecognizer) {
		let location = recognizer.location(in: tableView)
		guard let indexPath = tableView?.indexPathForRow(at: location) else {
			return
		}
		
		if recognizer.state == .ended {
			let item = items[indexPath.row]
			delegate?.didLongPressItem(item)
		}
	}
}
