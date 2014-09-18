//
//  SubscriptionStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class SubscriptonStore : SubscriptionStoreProtocol {
    private var cdh : CoreDataHelper = { return CoreDataHelper() }()
    
    public func getSubscriptions() -> Promise<[Subscription]> {
        var outputPromise:Promise<[Subscription]> = Promise.defer()
        
        // TODO - Store request in database and check for that before grabbing subscriptions
        
        var rest = Rest()
        
        var promise = rest.get("api/subscription") as Promise<SubscriptionModelCollection>
        
        promise.then { (model: SubscriptionModelCollection) -> () in
            var output:[Subscription] = []
            
            for subscription in model.subscriptions {
                var newModel:Subscription = self.cdh.create(Storage.subscriptionKey)
                newModel.id = subscription.id
                newModel.administrate = subscription.administrate
                newModel.read = subscription.read
                newModel.write = subscription.write
                
                var stream:Stream = self.cdh.create(Storage.streamKey)
                stream.id = subscription.stream.id
                stream.name = subscription.stream.name
                stream.key = subscription.stream.key
                
                newModel.stream = stream
                
                output.append(newModel)
            }
            
            outputPromise.resolve(output)
        }
        
        return outputPromise
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