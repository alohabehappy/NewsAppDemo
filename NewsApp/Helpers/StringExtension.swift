//
//  DateFormatterExtension.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation

extension String {
	
	func dateFromHabrRss() -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "E, dd MMM yyyy HH:mm:ss 'GMT'"
		return dateFormatter.date(from: self)
	}
	
}
