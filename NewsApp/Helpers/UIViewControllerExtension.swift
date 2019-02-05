//
//  UIViewControllerExtension.swift
//  NewsApp
//
//  Created by Vadim on 05/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIViewController {
	
	func showHUD() {
		MBProgressHUD.showAdded(to: view, animated: true)
	}
	
	func hideHUD() {
		MBProgressHUD.hide(for: view, animated: true)
	}
	
	func showErrorAlert(message: String) {
		let alert = AlertHelper.alert(title: "Error", message: message, controller: self, buttons: nil, completion: nil)
		present(alert, animated: true, completion: nil)
	}
	
}
