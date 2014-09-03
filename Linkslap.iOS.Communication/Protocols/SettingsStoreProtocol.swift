//
//  SettingsStoreProtocol.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public protocol SettingsStoreProtocol {
    var disableAllNotifications : Bool { get set }
    var subscriptionSettings : [ SubscriptionSettings ] { get }
    func showPushNotifications(streamKey : String) -> Bool
    func showInNewLinks(streamKey : String) -> Bool
    func saveSubscriptionSettings() -> Void
    func removeSubscriptionSettings(subscriptionId : Int) -> Void
}