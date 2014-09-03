//
//  Rest.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class Rest {
    private var baseUrl : String?
    private var bearerToken : String?
    
    public convenience init() {
        self.init(baseUrl: "")
        
        
    }
    
    public init(baseUrl : String) {
        self.baseUrl = baseUrl;
    }
}