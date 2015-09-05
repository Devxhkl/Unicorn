//
//  ViewController.swift
//  Unicorn
//
//  Created by Zel Marko on 05/09/15.
//  Copyright (c) 2015 The Unicorns. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var travelScheduleTableView: UITableView!
    
    var selectedRow: NSIndexPath!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelScheduleTableView.tableFooterView = UIView()
        travelScheduleTableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0)
        title = "Travel Schedule"
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("nameCell") as! UITableViewCell
            
            cell.separatorInset = UIEdgeInsetsMake(0, tableView.bounds.size.width, 0, 0)
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("fromCell") as! ScheduleFromCell
            
            
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("viaCell") as! UITableViewCell
            
            if selectedRow == indexPath.row {
            }
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("toCell") as! UITableViewCell
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
            cell.separatorInset = UIEdgeInsetsMake(0, tableView.bounds.size.width, 0, 0)
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedRow = indexPath
        
        travelScheduleTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        travelScheduleTableView.beginUpdates()
        travelScheduleTableView.endUpdates()
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if selectedRow != nil {
            if indexPath.row == selectedRow.row {
                return 268
            }
        }
        
        
        if indexPath.row == 0 {
            return 100
        }
        else {
            return 61
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


