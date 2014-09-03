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
        var encodedUserName = userName.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        var encodedPassword = password.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        
        var rest = Rest()
        var request = NSMutableURLRequest()
        request.HTTPMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        var data = "grant_type=password&username=\(encodedUserName!)&password=\(encodedPassword!)"
        //request.HTTPBody = NSData(base64EncodedString: data, options: NSDataBase64DecodingOptions.allZeros)
        request.HTTPBody = data.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        
        var promise = Promise<Account>.defer()
        var restPromise:Promise<AccountModel> = rest.execute(request, resource: "token", parameters: nil)
        
        restPromise.then { (value:AccountModel?) -> () in
            if(value == nil) {
                promise.fail(error: NSError())
                return
            }
            
            var account:Account = self.cdh.create(Storage.accountKey)
            account.id = value!.id!
            account.userName = value!.userName!
            account.email = value!.id? ?? ""
            account.bearerToken = value!.bearerToken!
            account.tokenIssued = value!.tokenIssued!
            account.tokenExpires = value!.tokenExpires!
            
            self.cdh.saveContext()
            
            promise.resolve(account);
        }
        
        return promise
    }
    
    public func get() -> Account? {
        return Storage.account
    }
    
    public func register(user : RegisterModel) -> Promise<Int> {
        var promise = Promise<Int>.defer();
        
        var rest = Rest()
        var p:Promise<Rest.NoData> = rest.post("/api/account/register", parameters: user.toJson())
        
        p.then { (value: Rest.NoData?) -> () in
            promise.resolve(1)
        }.fail { (error) -> () in
            promise.reject(error)
        }
        
        return promise
    }
    
    public func logout() -> Void {
        Storage.clearAll()
        
        NotificationStore.UnRegister()
    }
    
    public func resetPassword(email : String) -> Promise<Bool> {
        var promise = Promise<Bool>.defer()
        
        var rest = Rest()
        var json : [String:AnyObject] = [
            "email": email
        ]
        
        var p:Promise<Rest.NoData> = rest.post("/api/account/resetpassword", parameters: JSON(json))
        
        p.then { (value:Rest.NoData?) in
            promise.resolve(true)
        }.fail { (error) in
            promise.reject(error)
        }
        
        return promise
    }
}