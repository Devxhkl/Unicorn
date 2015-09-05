//
//  BeacViewController.swift
//  Unicorn
//
//  Created by Zel Marko on 05/09/15.
//  Copyright (c) 2015 The Unicorns. All rights reserved.
//

import UIKit

class BeacViewController: UIViewController {

    @IBOutlet weak var scWidth: NSLayoutConstraint!
    @IBOutlet weak var scHeight: NSLayoutConstraint!
    @IBOutlet weak var scImgVIew: UIImageView!
    
    var li = 4
    var childz: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scWidth.constant = UIScreen.mainScreen().bounds.width
        scHeight.constant = UIScreen.mainScreen().bounds.height
        
        if (childz != nil) {
            
            let c = childz
            if c == false {
                scHeight.constant = UIImage(named: "child-view-04")!.size.height / 2
                scImgVIew.image = UIImage(named: "child-view-04")
                scImgVIew.userInteractionEnabled = false
            }
            
        }
    }
    
    @IBAction func changeImage(sender: AnyObject) {
        if li == 5 {
            li = 4
            scImgVIew.image = UIImage(named: "pv3")
        }
        else {
            scImgVIew.image = UIImage(named: "pv\(li++)")
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
