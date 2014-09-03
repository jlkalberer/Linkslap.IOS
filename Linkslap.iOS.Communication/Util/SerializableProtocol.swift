//
//  SerializableProtocol.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/3/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public protocol SerializableProtocol {
    init()
    func fromJson(json: JSON)
}