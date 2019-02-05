//
//  AuthProvider.swift
//  NewsApp
//
//  Created by Vadim on 05/02/2019.
//  Copyright © 2019 alohabehappy. All rights reserved.
//

import Foundation

enum AuthError: LocalizedError {
	case invalidCredentials
	
	var errorDescription: String? {
		switch self {
		case .invalidCredentials:
			return "Invalid email or password"
		}
	}
}

final class AuthProvider {
	
	private let persistenceManager = PersistenceManager.shared
	
	var isLoggedIn: Bool {
		return currentUser == nil ? false : true
	}
	var currentUser: UserEntity? {
		return persistenceManager.fetchFirst(UserEntity.self)
	}
	
	func login(email: String?, password: String?) throws {
		guard let email = email, email == AppConstants.validEmail,
			let password = password, password == AppConstants.validPassword else {
				throw AuthError.invalidCredentials
		}
		
		let userObject = UserEntity(context: persistenceManager.context)
		userObject.email = email
		persistenceManager.save()
	}
	
	func logout() {
		guard let currentUser = currentUser else { return }
		persistenceManager.delete(currentUser)
	}
	
}
