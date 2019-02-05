//
//  ProfileContainerViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

class ProfileContainerViewController: BaseContainerViewController {
	
	private let authProvider = AuthProvider()
	
	private lazy var loginViewController: UIViewController = {
		let controller = UIStoryboard.main.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
		controller.delegate = self
		return controller
	}()
	private lazy var profileViewController: UIViewController = {
		let controller = UIStoryboard.main.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
		controller.delegate = self
		return controller
	}()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let viewController = authProvider.isLoggedIn ? profileViewController : loginViewController
		showContainedController(viewController, container: view)
    }

}

// MARK: - LoginViewControllerDelegate
extension ProfileContainerViewController: LoginViewControllerDelegate {
	
	func didLogin(email: String?, password: String?) {
		do {
			try authProvider.login(email: email, password: password)
		} catch {
			showErrorAlert(message: error.localizedDescription)
			return
		}
		
		replaceContainedController(from: loginViewController, to: profileViewController, container: view, animated: true)
	}
	
}

// MARK: - ProfileViewControllerDelegate
extension ProfileContainerViewController: ProfileViewControllerDelegate {
	
	func didLogout() {
		authProvider.logout()
		
		replaceContainedController(from: profileViewController, to: loginViewController, container: view, animated: true)
	}
	
}
