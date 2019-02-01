//
//  FeedViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
	
	let client = HabrRSSClient()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		client.getRSSFeed { (hubs) in
			print(hubs)
		}
    }

}
