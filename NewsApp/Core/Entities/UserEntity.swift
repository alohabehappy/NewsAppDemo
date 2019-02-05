//
//  UserEntity+CoreDataClass.swift
//  
//
//  Created by Vadim on 01/02/2019.
//
//

import Foundation
import CoreData

@objc(UserEntity)
public class UserEntity: NSManagedObject {

	@NSManaged public var email: String?
	@NSManaged public var favorites: NSSet?
	
}
