//
//  Link.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

@objc(Link)
public class Link: NSManagedObject {

    @NSManaged var streamName: String
    @NSManaged var streamKey: String
    @NSManaged var id: NSNumber
    @NSManaged var url: String
    @NSManaged var comment: String
    @NSManaged var createdDate: NSDate
    @NSManaged var userName: String

}
