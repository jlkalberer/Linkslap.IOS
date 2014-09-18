//
//  ViewStreamController.swift
//  Linkslap.iOS
//
//  Created by John Kalberer on 9/17/14.
//  Copyright (c) 2014 Linkslap. All rights reserved.
//

import UIKit

class ViewStreamController: UITableViewController {

    var streamKey:String!
    
    var streamStore:StreamStoreProtocol = StreamStore()
    
    var links:[Link] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.contentInset.bottom = 49
        
        var promise = streamStore.getStreamLinks(streamKey)
        
        promise.then { (value: [Link]) -> () in
            self.links = value
            self.tableView.reloadData()
        }
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return self.links.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel!.text = self.links[indexPath.row].comment
        
        return cell
    }
    
    override func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // performSegueWithIdentifier("view_stream", sender: self)
    }
}
