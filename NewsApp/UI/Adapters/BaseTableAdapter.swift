//
//  Copyright © 2018 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class BaseTableAdapter: NSObject, UITableViewDataSource, UITableViewDelegate {
	
	var tableView: UITableView?
	
	func connect(tableView: UITableView) {
		self.tableView = tableView
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	func disconnect() {
		self.tableView?.delegate = nil
		self.tableView?.dataSource = nil
		self.tableView = nil
	}
	
	func refresh() {
		tableView?.reloadData()
	}
	
	// MARK: - UITableViewDataSource
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
}
