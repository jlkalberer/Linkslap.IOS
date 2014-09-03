//
//  Account.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

@objc(Account)
public class Account: NSManagedObject {

    @NSManaged var id: String
    @NSManaged var userName: String
    @NSManaged var email: String
    @NSManaged var bearerToken: String
    @NSManaged var tokenIssued: NSDate
    @NSManaged var tokenExpires: NSDate

}
