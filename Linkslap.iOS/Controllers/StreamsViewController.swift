//
//  StreamsViewController.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/16/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import UIKit

class StreamsViewController: UITableViewController {

    var subscriptionStore: SubscriptionStoreProtocol = SubscriptonStore()
    
    var subscriptions: [Subscription] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.tableView.contentInset.bottom = 49
        
        var promise = subscriptionStore.getSubscriptions()
        
        promise.then { (value: [Subscription]) -> () in
            self.subscriptions = value
            self.tableView.reloadData()
        }
            
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subscriptions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel!.text = (self.subscriptions[indexPath.row].stream as Stream).name
        
        return cell
    }

    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("view_stream", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "view_stream") {
            var indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var streamKey = subscriptions[indexPath.row].stream.key
            (segue.destinationViewController as ViewStreamController).streamKey = streamKey
        }
    }
}
