//
//  Subscription.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

@objc(Subscription)
public class Subscription: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var administrate: NSNumber
    @NSManaged var read: NSNumber
    @NSManaged var write: NSNumber
    @NSManaged var stream: Stream

}
