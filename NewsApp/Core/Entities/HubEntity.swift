//
//  HubEntity.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation
import SWXMLHash

final class HubEntity {
	
	var title: String
	var link: String
	var date: Date
	var text: String
	
	// MARK: - XML
	
	private enum Keys {
		static let title = "title"
		static let link = "link"
		static let date = "pubDate"
		static let text = "description"
	}
	
	init(xml: XMLIndexer) {
		self.title = xml[Keys.title].element?.text ?? ""
		self.link = xml[Keys.link].element?.text ?? ""
		self.date = xml[Keys.date].element?.text.dateFromHabrRss() ?? Date()
		self.text = xml[Keys.text].element?.text ?? ""
	}
	
}
