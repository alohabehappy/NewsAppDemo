//
//  LoginViewController.swift
//  NewsApp
//
//  Created by Vadim on 01/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit

protocol LoginViewControllerDelegate: class {
	func didLogin(email: String?, password: String?)
}

class LoginViewController: UIViewController {

	weak var delegate: LoginViewControllerDelegate?
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// TODO: remove
		emailTextField.text = AppConstants.validEmail
		passwordTextField.text = AppConstants.validPassword
    }
	
	@IBAction func loginPressed(_ sender: UIButton) {
		delegate?.didLogin(email: emailTextField.text,
						   password: passwordTextField.text)
	}

}
