//
//  Storage.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

public struct Storage {
    static let accountKey = "Account"
    static let settingsKey = "Settings"
    static let linkKey = "Link"
    static let streamKey = "Stream"
    static let subscriptionKey = "Subscription"
    static let subscriptionSettingsKey = "SubscriptionSettings"
    
    static var cdh : CoreDataHelper = { return CoreDataHelper() }()
    
    public static func getInstallationId() -> String {
        var settings = getSettings()
        return settings.installationId
    }
    
    public static func clearAll() {
        cdh.clear(accountKey)
        cdh.clear(linkKey)
        cdh.clear(streamKey)
        cdh.clear(subscriptionKey)
        cdh.clear(subscriptionSettingsKey)
    }
    
    public static func clear(key: NSString) {
        if (key == "") {
            return
        }
        
        cdh.clear(key)
    }
    
    public static var account : Account? {
        get {
            var accounts: [Account] = cdh.all(accountKey)
            
            if (accounts.count == 0) {
                return nil
            }
            
            return accounts[0]
        }
    }
    
    /*public static func save<TModel>(key: NSString, value: TModel) {
        cdh.saveContext()
    }
    
    public static func load<TModel>(key: NSString) {
        
    }*/
    
    public static func getSettings() -> Settings {
        var output : [Settings] = cdh.all(settingsKey)
        
        if (output.count == 0) {
            var newSettings: Settings = cdh.create(settingsKey)
            newSettings.newUser = true;
            newSettings.installationId = NSUUID.UUID().UUIDString
            
            cdh.saveContext()
        }
        
        return output[0];
    }
}