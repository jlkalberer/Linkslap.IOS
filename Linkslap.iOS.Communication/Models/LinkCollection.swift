//
//  LinkCollection.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/17/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class LinkCollection : SerializableProtocol {
    required public init() { }
    
    public var links:[LinkModel] = []
    
    public func fromJson(json: JSON) {
        var resultsArray = json.asArray;
        
        for jsonResult in resultsArray! {
            var model = LinkModel()
            model.fromJson(jsonResult)
            
            links.append(model)
        }
    }
}