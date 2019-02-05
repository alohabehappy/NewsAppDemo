//
//  FeedProvider.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation
import SWXMLHash
import Reachability

typealias FetchHubsCompletion = ([HubEntity] , Error?) -> Void

final class FeedProvider {
	
	let habrClient = HabrRSSClient()
	let persistenceManager = PersistenceManager.shared
	let reachability = Reachability()
	
	init() {
		NotificationCenter.default.addObserver(self, selector: #selector(contextObjectsDidChange(_:)), name: Notification.Name.NSManagedObjectContextObjectsDidChange, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(contextWillSave(_:)), name: Notification.Name.NSManagedObjectContextWillSave, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(contextDidSave(_:)), name: Notification.Name.NSManagedObjectContextDidSave, object: nil)
	}
	
	@objc func contextObjectsDidChange(_ notification: Notification) {
		print(notification)
	}
	
	@objc func contextWillSave(_ notification: Notification) {
		print(notification)
	}
	
	@objc func contextDidSave(_ notification: Notification) {
		print(notification)
	}
	
	func fetchHubs(completion: @escaping FetchHubsCompletion) {
		switch reachability?.connection {
		case .none:
			loadFromCache(completion: completion)
		default:
			loadFromNetwork(completion: completion)
		}
	}
	
	private func loadFromCache(completion: @escaping FetchHubsCompletion) {
		let hubs = persistenceManager.fetch(HubEntity.self)
		completion(hubs, nil)
	}
	
	private func loadFromNetwork(completion: @escaping FetchHubsCompletion) {
		habrClient.getRSSFeed { [weak self] (data, error) in
			guard let strongSelf = self else { return }
			
			if let error = error {
				completion([], error)
				return
			}
			
			guard let data = data else { return }
			
			let xml = SWXMLHash.parse(data)
			let xmlItems = xml["rss"]["channel"]["item"].all
			
			let context = strongSelf.persistenceManager.newBackgroundContext()
			context.performAndWait {
				var hubs: [HubEntity] = []
				
				for xmlItem in xmlItems {
					let object = HubEntity(context: context)
					object.populateFromXML(xmlItem)
					hubs.append(object)
				}
				
				do {
					try context.save()
					print("Saved successfully")
				} catch {
					let nserror = error as NSError
					fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
				}
			
				completion(hubs, nil)
			}
		}
	}
	
}
