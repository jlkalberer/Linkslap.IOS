//
//  AccountStoreProtocol.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/2/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import Foundation

public protocol AccountStoreProtocol {
    func authenticate(userName : String, password : String) -> Promise<Account>
    func get() -> Promise<Account>
    func register(user : RegisterModel) -> Promise<Int>
    func logout() -> Void
    func resetPassword(email : String) -> Promise<Bool>
}