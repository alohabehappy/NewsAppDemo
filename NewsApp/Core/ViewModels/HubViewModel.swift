//
//  HubViewModel.swift
//  NewsApp
//
//  Created by Vadim on 05/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation

struct HubViewModel {
	
	var title: String
	var date: String
	var text: String
	
	init(entity: HubEntity) {
		self.title = entity.title
		self.date = entity.date.stringForHubCell() ?? ""
		self.text = entity.text
	}
	
}
