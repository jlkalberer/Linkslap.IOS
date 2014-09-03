
//
//  Account.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class AccountModel: SerializableProtocol {
    required public init() {
    }
    
    var id: String?
    var userName: String?
    var email: String?
    var bearerToken: String?
    var tokenIssued: NSDate?
    var tokenExpires: NSDate?
    
    public func fromJson(json: JSON) {
        id = json["id"].asString
        userName = json["userName"].asString
        email = json["email"].asString
        bearerToken = json["access_token"].asString
        tokenIssued = json[".issued"].asDate
        tokenExpires = json[".expires"].asDate
    }

}
