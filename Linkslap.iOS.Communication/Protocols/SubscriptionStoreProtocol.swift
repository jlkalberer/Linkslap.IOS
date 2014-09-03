//
//  SubscriptionStoreProtocol.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public protocol SubscriptionStoreProtocol {
    func getSubscriptions() -> Promise<[Subscription]>
    func add(streamKey : String) -> Promise<Subscription>
    func delete(streamKey : String) -> Void
    func getSubscription(id : Int) -> Subscription
    func getSubscription(streamKey : String) -> Subscription
}