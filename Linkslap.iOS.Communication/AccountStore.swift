//
//  AccountStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class AccountStore : AccountStoreProtocol {
    public func authenticate(userName : String, password : String) -> Promise<Account> {
        var promise = Promise<Account>.defer();
        
        
        
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