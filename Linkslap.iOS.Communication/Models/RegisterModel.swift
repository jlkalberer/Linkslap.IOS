//
//  RegisterModel.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class RegisterModel : SerializableProtocol {

    public required init() {}
    
    public var email : String?
    public var userName : String?
    public var password : String?
    public var confirmPassword : String?
    
    public func fromJson(json: JSON) {
        
    }
    
    public func toJson() -> JSON {
        var output : Dictionary<String, AnyObject> = [
            "foo": "foo"
            /*"email": email ?? JSON.null,
            "userName": userName ?? JSON.null,
            "password": password ?? JSON.null,
            "confirmPassword": confirmPassword ?? JSON.null*/
        ]
        
        return JSON(output)
    }
}