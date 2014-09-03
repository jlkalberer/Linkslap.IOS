//
//  Settings.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

@objc(Settings)
public class Settings: NSManagedObject {

    @NSManaged var installationId: NSString
    @NSManaged var disableAllNotifications: NSNumber
    @NSManaged var newUser: NSNumber

}
