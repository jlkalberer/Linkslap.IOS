//
//  NewSlapStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/3/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class NewSlapStore: NewSlapStoreProtocol {
    public var links : [ Link ] { get {
            return [Link]()
        }
    }
}