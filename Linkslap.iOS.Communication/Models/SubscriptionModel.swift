//
//  Subscription.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class SubscriptionModel : SerializableProtocol {
    required public init () { }
    
    var id: Int!
    var administrate: Bool!
    var read: Bool!
    var write: Bool!
    var stream: StreamModel!

    public func fromJson(json: JSON) {
        id = json["id"].asInt
        administrate = json["administrate"].asBool
        read = json["read"].asBool
        write = json["write"].asBool
        
        stream = StreamModel()
        stream.fromJson(json["stream"])
    }
}
