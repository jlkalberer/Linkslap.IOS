//
//  Rest.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class Rest {
    private var baseUrl : String?
    private var bearerToken : String?
    
    public convenience init() {
        self.init(baseUrl: AppSettings.baseUrl)
        
        bearerToken = Storage.account?.bearerToken
    }
    
    public init(baseUrl : String) {
        self.baseUrl = baseUrl;
    }
    
    public func get<TModel>(resource: NSString, parameters: NSDictionary? = nil) -> Promise<TModel> {
        return execute("GET", resource: resource, parameters: parameters)
    }
    
    public func execute<TModel>(method: NSString, resource: NSString, parameters: NSDictionary? = nil) -> Promise<TModel> {
        var request: NSMutableURLRequest = NSMutableURLRequest()
        request.HTTPMethod = method;
        
        return execute(request, resource: resource, parameters: parameters)
    }
    
    public func execute<TModel>(request: NSMutableURLRequest, resource: NSString, parameters: NSDictionary? = nil) -> Promise<TModel> {
        var promise = Promise<TModel>.defer();
        
        return promise;
    }
}