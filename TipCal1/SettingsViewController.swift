//
//  SettingsViewController.swift
//  TipCal1
//
//  Created by Dinh Thi Minh on 11/2/15.
//  Copyright © 2015 Dinh Thi Minh. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let userDefaults  = NSUserDefaults.standardUserDefaults()
   
    @IBOutlet weak var segColour: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tipIndex = (userDefaults.integerForKey("ind"))
        tipControl.selectedSegmentIndex = tipIndex
       
        // Load new theme
        let bgColorNo = (userDefaults.integerForKey("bgColour"))
        switch (bgColorNo) {
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.whiteColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
        }
        segColour.selectedSegmentIndex = bgColorNo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func actPercentage(sender: AnyObject) {
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let index = tipControl.selectedSegmentIndex
        
        //Save
        userDefaults.setObject(tipPercentage, forKey: "tip")
        userDefaults.setInteger(index, forKey: "ind")

    }
    
    
    @IBAction func actColour(sender: UISegmentedControl) {
        switch (segColour.selectedSegmentIndex) {
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.whiteColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
        }
        userDefaults.setInteger(segColour.selectedSegmentIndex, forKey: "bgColour")
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
