//
//  ProfileViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

protocol ProfileViewControllerDelegate: class {
	func didLogout()
}

class ProfileViewController: UIViewController {
	
	weak var delegate: ProfileViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func favoritesPressed(_ sender: UIButton) {
		print(#function)
	}
	
	@IBAction func logoutPressed(_ sender: UIButton) {
		delegate?.didLogout()
	}

}
