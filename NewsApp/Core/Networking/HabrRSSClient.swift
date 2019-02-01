//
//  HabrRSSClient.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation
import SWXMLHash

private enum Constants {
	static let baseURL = "https://habr.com/ru/rss/hubs/"
}

final class HabrRSSClient {
	
	func getRSSFeed(completion: (([HubEntity]) -> Void)?) {
		guard let url = URL(string: Constants.baseURL) else { return }
		
		let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
			guard let strongSelf = self else { return }
			
			if let error = error {
				print(error)
				return
			}
			let hubs = strongSelf.parse(data)
			completion?(hubs)
		}
		task.resume()
	}
	
	private func parse(_ data: Data?) -> [HubEntity] {
		guard let data = data else { return [] }
		
		let xml = SWXMLHash.parse(data)
		let elements = xml["rss"]["channel"]["item"].all
		return elements.map{ HubEntity(xml: $0) }
	}
	
}
