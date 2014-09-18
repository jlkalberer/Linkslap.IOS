//
//  StreamStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/17/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public class StreamStore : StreamStoreProtocol {
    private var cdh : CoreDataHelper = { return CoreDataHelper() }()
    
    public func newStream() -> Promise<Stream> {
        return Promise.defer()
    }
    
    public func getStreamLinks(streamKey : String) -> Promise<[Link]> {
        var outputPromise:Promise<[Link]> = Promise.defer()
        
        var rest = Rest();
        
        var promise:Promise<LinkCollection> = rest.get("api/stream/\(streamKey)/links")
        
        promise.then { (value: LinkCollection) -> () in
            var output:[Link] = []
            
            for lm in value.links {
                var model = self.cdh.create(Storage.linkKey) as Link
                model.id = lm.id
                model.streamName = lm.streamName
                model.streamKey = lm.streamKey
                model.url = lm.url
                model.comment = lm.comment ?? ""
                model.createdDate = lm.createdDate
                model.userName = lm.userName
                
                output.append(model)
            }
            
            outputPromise.resolve(output)
        }
        
        return outputPromise
    }
    
    public func slapLink(streamKey : String, comment : String, url : String) -> Promise<Link> {
        return Promise.defer()
    }
}