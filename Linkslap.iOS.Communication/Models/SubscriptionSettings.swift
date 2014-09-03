//
//  SubscriptionSettings.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

@objc(SubscriptionSettings)
public class SubscriptionSettings: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var streamKey: String
    @NSManaged var streamName: String
    @NSManaged var toastNotifications: NSNumber
    @NSManaged var showNewLinks: NSNumber

}
