//
//  SubscriptionStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class SubscriptonStore : SubscriptionStoreProtocol {
    public func getSubscriptions() -> Promise<SubscriptionModelCollection> {
        var rest = Rest()
        
        var promise = rest.get("api/subscription") as Promise<SubscriptionModelCollection>
        
        promise.then { (promise: SubscriptionModelCollection) -> () in
            var v = 0;
        }
        
        return Promise.defer()
    }
    public func add(streamKey : String) -> Promise<Subscription> {
        return Promise.defer()
    }
    public func delete(streamKey : String) -> Void {
        
    }
    public func getSubscription(id : Int) -> Subscription? {
        return nil
    }
    public func getSubscription(streamKey : String) -> Subscription? {
        return nil
    }
}