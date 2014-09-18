//
//  LinkModel.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class LinkModel : SerializableProtocol {
    required public init() { }
    
    var id: Int!
    var streamName: String!
    var streamKey: String!
    var url: String!
    var comment: String?
    var createdDate: NSDate!
    var userName: String!
    
    public func fromJson(json: JSON) {
        id = json["id"].asInt!
        streamName = json["streamName"].asString!
        streamKey = json["streamKey"].asString!
        url = json["url"].asString!
        comment = json["comment"].asString
        createdDate = json["createdDate"].asDate ?? NSDate()
        userName = json["userName"].asString!
    }
}