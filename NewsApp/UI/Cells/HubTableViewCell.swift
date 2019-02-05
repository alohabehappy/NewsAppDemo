//
//  HubTableViewCell.swift
//  NewsApp
//
//  Created by Vadim on 05/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

final class HubTableViewCell: UITableViewCell {

	@IBOutlet weak var hubTitleLabel: UILabel!
    @IBOutlet weak var hubDateLabel: UILabel!
	@IBOutlet weak var hubTextLabel: UILabel!
	
	func configure(with viewModel: HubViewModel) {
		hubTitleLabel.text = viewModel.title
		hubDateLabel.text = viewModel.date
		hubTextLabel.text = viewModel.text
	}
	
}
