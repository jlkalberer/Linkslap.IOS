//
//  PushRegistration.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class PushRegistration {
    public var platform : String {
        get {
            return "ios"
        }
    }
    public var installationId : String?
    public var channelUri : String?
    public var deviceToken : String?
}