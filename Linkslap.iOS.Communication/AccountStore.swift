//
//  AccountStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class AccountStore : AccountStoreProtocol {
    private var cdh : CoreDataHelper = { return CoreDataHelper() }()
    
    public func authenticate(userName : String, password : String) -> Promise<Account> {
        var promise = Promise<Account>.defer();
        
        var encodedUserName = userName.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        var encodedPassword = password.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        
        
        return promise;
    }
    
    public func get() -> Promise<Account> {
        return Promise<Account>.defer()
    }
    
    public func register(user : RegisterModel) -> Promise<Int> {
        return Promise<Int>.defer()
    }
    
    public func logout() -> Void {
        
    }
    
    public func resetPassword(email : String) -> Promise<Bool> {
        return Promise<Bool>.defer()
    }
}