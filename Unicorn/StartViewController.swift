//
//  StartViewController.swift
//  Unicorn
//
//  Created by Zel Marko on 05/09/15.
//  Copyright (c) 2015 The Unicorns. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {
    
    var child: Bool!

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Verification"
        textField.becomeFirstResponder()
    }
    
    @IBAction func proceed(sender: AnyObject) {
        let l = last(textField.text)
        if l == "0" {
            child = true
        }
        else {
            child = false
        }
        performSegueWithIdentifier("proceedSegue", sender: self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "proceedSegue" {
            let dest = segue.destinationViewController as! TravellersViewController
            dest.childz = child
        }
        
    }
    

}
