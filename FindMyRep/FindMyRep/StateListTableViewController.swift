//
//  StateListTableViewController.swift
//  FindMyRep
//
//  Created by Eva Marie Bresciano on 6/8/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StateController.statesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)
        let state = StateController.statesArray[indexPath.row]
        cell.textLabel?.text = state
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailSegue",
            let stateDVC = segue.destinationViewController as? StateDetailTableViewController {
            if let indexPath = tableView.indexPathForSelectedRow?.row {
                let state = StateController.statesArray[indexPath]
                stateDVC.state = state
            }
        }
    }
    
    
}