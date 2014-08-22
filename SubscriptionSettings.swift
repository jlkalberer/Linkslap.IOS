//
//  SubscriptionSettings.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class SubscriptionSettings {
    public var id: Int?
    public var streamKey: String?
    public var streamName: String?
    public var toastNotifications: Bool = false
    public var showNewLinks: Bool = false
}