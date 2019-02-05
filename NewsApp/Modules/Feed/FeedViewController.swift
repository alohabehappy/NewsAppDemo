//
//  FeedViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
	
	let provider = FeedProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		provider.fetchHubs { (hubs, error) in
			print(hubs)
			print(error ?? "")
		}
    }

}
