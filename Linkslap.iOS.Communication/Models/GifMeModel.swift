
//
//  GifMeModel.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class GifMeModel: SerializableProtocol {
    public required init() {
        meta = GifMeMeta()
        results = [GifMeResult]()
    }
    
    public var status : Int = 0
    public var meta : GifMeMeta
    public var results : [GifMeResult]
    
    public func fromJson(json: JSON) {
        status = json["status"].asInt ?? 0
        meta = GifMeMeta()
        meta.term = json["meta"]["term"].asString
        meta.limit = json["meta"]["limit"].asInt ?? 0
        meta.page = json["meta"]["page"].asInt ?? 0
        meta.totalPages = json["meta"]["total_pages"].asInt ?? 0
        meta.total = json["meta"]["total"].asInt ?? 0
        meta.timing = json["meta"]["timing"].asString
        
        var resultsArray = json["data"].asArray;
        
        if (resultsArray == nil) {
            return
        }
        
        for jsonResult in resultsArray! {
            var result = GifMeResult()
            result.id = jsonResult["id"].asInt ?? 0
            result.score = jsonResult["score"].asString
            result.nsfw = jsonResult["nsfw"].asBool ?? false
            result.link = jsonResult["link"].asString
            result.thumb = jsonResult["thumb"].asString
            result.createdAt = jsonResult["created_at"].asDate
        }
    }
    
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