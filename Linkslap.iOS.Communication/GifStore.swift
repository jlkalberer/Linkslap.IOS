//
//  GifStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/3/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class GifStore : GifStoreProtocol {
    public func search(query: String, nsfw: Bool, page: Int = 0) -> Promise<GifMeModel> {
        var rest = Rest(baseUrl: "http://api.gifme.io")
        
        var params : [String:AnyObject] = [
            "key": "",
            "query":"",
            "sfw": (nsfw ? "false" : "true"),
            "limit": 20,
            "page": page
        ]
        
        return rest.get("/v1/search", parameters: JSON(params))
    }
}