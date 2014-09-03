//
//  GifStoreProtocol.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public protocol GifStoreProtocol {
    func search(query : String, nsfw : Bool, page : Int) -> Promise<GifMeModel>
}