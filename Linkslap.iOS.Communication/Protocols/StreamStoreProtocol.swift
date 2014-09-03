//
//  IStreamStore.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 8/22/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public protocol StreamStoreProtocol {
    func newStream() -> Promise<Stream>
    func getStreamLinks(streamKey : String) -> Promise<[Link]>
    func slapLink(streamKey : String, comment : String, url : String) -> Promise<Link>
}