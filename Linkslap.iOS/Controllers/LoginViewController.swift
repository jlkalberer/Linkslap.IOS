//
//  LoginViewController.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import UIKit

class LoginViewController : UIViewController {
    
    var accountStore: AccountStoreProtocol = AccountStore()
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginTouched(sender: UIButton) {
        
        var result = accountStore.authenticate(userName.text, password: password.text)
        let viewSelf = self;
        
        result.then {(promise: Account?) in
            self.performSegueWithIdentifier("home", sender: self)
        }
        // performSegueWithIdentifier("home", sender: self)
    }
}