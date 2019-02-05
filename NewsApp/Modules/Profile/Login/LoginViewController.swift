//
//  LoginViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
	func didLogin()
}

class LoginViewController: UIViewController {

	weak var delegate: LoginViewControllerDelegate?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	@IBAction func loginPressed(_ sender: UIButton) {
		delegate?.didLogin()
	}

}
