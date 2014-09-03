//
//  Subscription.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class Subscription {
    public var id : Int?
    public var stream : Stream?
    public var administrate : Bool = false
    public var read : Bool = false
    public var write : Bool = false
}