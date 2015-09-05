//
//  TravellersViewController.swift
//  Unicorn
//
//  Created by Zel Marko on 05/09/15.
//  Copyright (c) 2015 The Unicorns. All rights reserved.
//

import UIKit

class TravellersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var travTable: UITableView!
    
    var childz: Bool!
    var child = true
    
    let children = [["Daughter", "Jessica Miller"], ["Son", "Adrian Miller"], ["Niece", "Marlene Schmidt"]]
    let relatives = [["Mother", "Agatha Miller"], ["Father", "Richard Miller"], ["Aunt", "Anneliese Schmidt"]]
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if childz != nil {
            child = !childz
            
        }
        
        if !child {
            title = "Relatives"
        }
        else {
            title = "Travellers"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        travTable.tableFooterView = UIView()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("travellersCell", forIndexPath: indexPath) as! TravellersCell
        
        
        
        if indexPath.row == 0 {
            cell.statusLabel.text = child ? children[indexPath.row][0] : relatives[indexPath.row][0]
            cell.nameLabel.text = child ? children[indexPath.row][1] : relatives[indexPath.row][1]
        }
        else if indexPath.row == 1 {
            cell.statusLabel.text = child ? children[indexPath.row][0] : relatives[indexPath.row][0]
            cell.nameLabel.text = child ? children[indexPath.row][1] : relatives[indexPath.row][1]
        }
        else {
            cell.statusLabel.text = child ? children[indexPath.row][0] : relatives[indexPath.row][0]
            cell.nameLabel.text = child ? children[indexPath.row][1] : relatives[indexPath.row][1]
        }
        
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let d = segue.destinationViewController as! BeacViewController
        d.childz = child
    }
    

}
