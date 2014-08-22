
//
//  GifMeModel.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class GifMeModel {
    public var status : Int = 0
    public var meta : GifMeMeta?
    public var results : [GifMeResult]?
    
    public class GifMeMeta {
        public var term : String?
        public var limit : Int = 0
        public var page : Int = 0
        public var totalPages : Int = 0
        public var total : Int = 0
        public var timing : String?
    }
    
    public class GifMeResult {
        public var id : Int = 0
        public var score : String?
        public var nsfw : Bool = false
        public var link : String?
        public var thumb : String?
        public var createdAt : NSDate?
    }
}