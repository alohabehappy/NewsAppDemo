//
//  DateExtension.swift
//  NewsApp
//
//  Created by Vadim on 05/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation

extension Date {
	
	func stringForHubCell() -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd.MM.yyyy"
		return dateFormatter.string(from: self)
	}
	
}
