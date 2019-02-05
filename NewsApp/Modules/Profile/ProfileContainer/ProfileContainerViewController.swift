//
//  ProfileContainerViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

class ProfileContainerViewController: BaseContainerViewController {
	
	lazy var loginViewController: UIViewController = {
		let controller = UIStoryboard.main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
		controller.delegate = self
		return controller
	}()
	lazy var profileViewController: UIViewController = {
		let controller = UIStoryboard.main.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
		controller.delegate = self
		return controller
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		showContainedController(loginViewController, container: view)
    }

}

// MARK: - LoginViewControllerDelegate
extension ProfileContainerViewController: LoginViewControllerDelegate {
	func didLogin() {
		replaceContainedController(from: loginViewController, to: profileViewController, container: view, animated: true)
	}
}

// MARK: - ProfileViewControllerDelegate
extension ProfileContainerViewController: ProfileViewControllerDelegate {
	func didLogout() {
		replaceContainedController(from: profileViewController, to: loginViewController, container: view, animated: true)
	}
}
