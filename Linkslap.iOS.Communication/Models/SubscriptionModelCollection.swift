//
//  SubscriptionModelCollection.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class SubscriptionModelCollection : SerializableProtocol {
    required public init() {
    }
    
    public var subscriptions : [SubscriptionModel] = []
    
    public func fromJson(json: JSON) {
        var resultsArray = json.asArray;
        
        for jsonResult in resultsArray! {
            var model = SubscriptionModel()
            model.fromJson(jsonResult)
            
            subscriptions.append(model)
        }
    }
}