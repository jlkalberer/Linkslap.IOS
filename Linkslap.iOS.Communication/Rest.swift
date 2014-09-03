//
//  Rest.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class Rest {
    private var baseUrl : String
    private var bearerToken : String?
    
    public convenience init() {
        self.init(baseUrl: AppSettings.baseUrl)
        
        bearerToken = Storage.account?.bearerToken
    }
    
    public init(baseUrl : String) {
        self.baseUrl = baseUrl;
    }
    
    public class NoData : SerializableProtocol {
        public required init() { }
        
        public func toJson() -> JSON {
            return JSON.parse("")
        }
        
        public func fromJson(json: JSON) { }
    }
    
    public func get<TModel : SerializableProtocol>(resource: NSString, parameters: JSON? = nil) -> Promise<TModel> {
        return execute("GET", resource: resource, parameters: parameters)
    }
    public func post<TModel : SerializableProtocol>(resource: NSString, parameters: JSON? = nil) -> Promise<TModel> {
        return execute("POST", resource: resource, parameters: parameters)
    }
    public func put<TModel : SerializableProtocol>(resource: NSString, parameters: JSON? = nil) -> Promise<TModel> {
        return execute("PUT", resource: resource, parameters: parameters)
    }
    public func delete<TModel : SerializableProtocol>(resource: NSString) -> Promise<TModel> {
        return execute("DELETE", resource: resource, parameters: nil)
    }
    
    public func execute<TModel : SerializableProtocol>(method: NSString, resource: NSString, parameters: JSON? = nil) -> Promise<TModel> {
        var request: NSMutableURLRequest = NSMutableURLRequest()
        request.HTTPMethod = method;
        
        return Promise<TModel>.defer() // executeRequest(request, resource: resource, parameters: parameters)
    }
    
    public func execute<TModel : SerializableProtocol>(request: NSMutableURLRequest, resource: NSString, parameters: JSON?) -> Promise<TModel> {
        var promise = Promise<TModel>.defer();
        var error: NSError?
        
        request.URL = NSURL(string: baseUrl + resource)
        
        if (parameters != nil) {
            var contentType = request.valueForHTTPHeaderField("Content-Type")
            if (contentType != nil || contentType? == "application/json") {
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.HTTPBody = parameters?.toString().dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
            } else {
                // request.HTTPBody = parameters as String
            }
        }
        
        if (bearerToken != nil && bearerToken!.isEmpty) {
            request.setValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")
        }
        
        if (error != nil) {
            promise.reject(error!)
            promise.resolve(nil)
            return promise
        }
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler: { (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            if (error != nil) {
                promise.reject(error)
                promise.resolve(nil)
                return
            }
            
            //if (response!)
            if (data != nil) {
                var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                var model = TModel()
                model.fromJson(JSON.parse(jsonString))
                promise.resolve(model)
            } else {
                promise.reject(error!)
                promise.resolve(nil)
            }
        })
        
        return promise;
    }
}