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
    
    public func get<TModel : SerializableProtocol>(resource: String, parameters: JSON? = nil) -> Promise<TModel> {
        return execute("GET", resource: resource, parameters: parameters)
    }
    public func post<TModel : SerializableProtocol>(resource: String, parameters: JSON? = nil) -> Promise<TModel> {
        return execute("POST", resource: resource, parameters: parameters)
    }
    public func put<TModel : SerializableProtocol>(resource: String, parameters: JSON? = nil) -> Promise<TModel> {
        return execute("PUT", resource: resource, parameters: parameters)
    }
    public func delete<TModel : SerializableProtocol>(resource: String) -> Promise<TModel> {
        return execute("DELETE", resource: resource, parameters: nil)
    }
    
    public func execute<TModel : SerializableProtocol>(method: String, resource: NSString, parameters: JSON? = nil) -> Promise<TModel> {
        var request: NSMutableURLRequest = NSMutableURLRequest()
        request.HTTPMethod = method;
        
        return execute(request, resource: resource, parameters: parameters)
    }
    
    public func execute<TModel : SerializableProtocol>(request: NSMutableURLRequest, resource: String, parameters: JSON?) -> Promise<TModel> {
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
        
        if (bearerToken != nil && !bearerToken!.isEmpty) {
            request.setValue("Bearer \(bearerToken!)", forHTTPHeaderField: "Authorization")
        }
        
        if (error != nil) {
            var errorString:String = error?.localizedDescription ?? ""
            var errorDescription:String = error?.localizedFailureReason ?? ""
            
            let values:[String:AnyObject] = [
                "error": errorString,
                "errorDescription": errorDescription
            ]
            
            promise.reject(JSON(values))
            
            return promise
        }
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler: { (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            if (error != nil) {
                var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                promise.reject(JSON.parse(jsonString))
                
                return
            }
            
            //if (response!)
            if (data != nil) {
                var jsonString = NSString(data: data!, encoding: NSUTF8StringEncoding)
                var model = TModel()
                
                var json = JSON.parse(jsonString);
                
                if (json["error"].asString != nil) {
                    promise.reject(json)
                    
                    return;
                }
                
                model.fromJson(json)
                promise.resolve(model)
            } else {
                let values:[String:AnyObject] = [
                    "error" : "Empty response"
                ]
                
                promise.reject(JSON(values))
            }
        })
        
        return promise;
    }
}