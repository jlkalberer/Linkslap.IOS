//
//  Stream.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation
import CoreData

@objc(Stream)
public class Stream: NSManagedObject {

    @NSManaged var id: NSNumber
    @NSManaged var name: String
    @NSManaged var key: String

}
