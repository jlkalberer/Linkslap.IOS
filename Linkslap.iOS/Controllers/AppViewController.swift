//
//  AppViewController.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import UIKit

class AppViewController: UIViewController {
    
    var accountStore: AccountStoreProtocol
    
    required init(coder aDecoder: NSCoder) {
        accountStore = AccountStore()
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let account = accountStore.get() {
            performSegueWithIdentifier("home", sender: self)
        } else {
            performSegueWithIdentifier("login", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
