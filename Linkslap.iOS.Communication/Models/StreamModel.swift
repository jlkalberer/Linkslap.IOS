//
//  Stream.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class StreamModel :SerializableProtocol {
    required public init () { }
    
    var id: NSNumber!
    var name: String!
    var key: String!

    public func fromJson(json: JSON) {
        id = json["id"].asInt
        name = json["name"].asString
        key = json["key"].asString
    }
}
