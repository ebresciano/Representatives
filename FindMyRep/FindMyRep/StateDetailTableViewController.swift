//
//  StateDetailTableViewController.swift
//  FindMyRep
//
//  Created by Eva Marie Bresciano on 6/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    
    var reps: [Rep] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let state = state {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            RepController.searchRepsByState(state, completion: { (reps) in
                self.reps = reps
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    self.tableView.reloadData()
                    
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                })
                
            })
            
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reps.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("repCell", forIndexPath: indexPath) as? RepTableViewCell ?? RepTableViewCell()
        
        let rep = reps[indexPath.row]
        cell.updateWithRep(rep)
        
        
        return cell
    }
}
