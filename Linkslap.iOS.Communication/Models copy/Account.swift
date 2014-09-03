//
//  Account.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

@objc(Account)
public class Account {
    public var id : String?
    public var userName : String?
    public var email : String?
    public var bearerToken : String?
    public var tokenIssued : NSDate?
    public var tokenExpires : NSDate?
}