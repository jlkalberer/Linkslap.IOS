//
//  Storage.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public struct Storage {
    static let account = "Account"
    static let settings = "Settings"
    static let link = "Link"
    static let subscription = "Subscription"
    static let subscriptionSettings = "SubscriptionSettings"
    
    static var cdh : CoreDataHelper = { return CoreDataHelper() }()
    
    public static func getInstallationId() -> String {
        var settings = getSettings()
        return settings.installationId
    }
    
    public static func clearAll() {
        var accounts : [Account] = cdh.all(account)
        var links : [Link] = cdh.all(link)
        var subscriptions : [Subscription] = cdh.all(subscription)
        var subscriptionSettingsCollection : [SubscriptionSettings] = cdh.all(subscriptionSettings)
        
    }
    
    public static func getSettings() -> Settings {
        var output : [Settings] = cdh.all(settings)
        
        if (output.count == 0) {
            var newSettings: Settings = cdh.create(settings)
            newSettings.newUser = true;
            newSettings.installationId = NSUUID.UUID().UUIDString
            
            cdh.saveContext()
        }
        
        return output[0];
    }
}