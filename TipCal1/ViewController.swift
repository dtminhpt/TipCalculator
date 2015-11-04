//
//  ViewController.swift
//  TipCal1
//
//  Created by Dinh Thi Minh on 10/30/15.
//  Copyright © 2015 Dinh Thi Minh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let userDefaults  = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set focus to bill field
        billField.becomeFirstResponder()
        
        // Load previous data
        var billAmount = userDefaults.doubleForKey("bill")
        var tipPercentage = userDefaults.doubleForKey("tip")
        var tipIndex = userDefaults.integerForKey("ind")
        
        // Set for initial values
        if (billAmount == 0) {
            billAmount = 100.0
            userDefaults.setObject(billAmount, forKey: "bill")
        }
        if (tipPercentage == 0) {
            tipPercentage = 0.1
            tipIndex = 0
            userDefaults.setObject(tipPercentage, forKey: "tip")
            userDefaults.setObject(tipIndex, forKey: "ind")
        }
        
        billField.text = String(format:"%.2f", billAmount)
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipControl.selectedSegmentIndex = tipIndex
        tipLabel.text = String(format:"$%.2f", tip)
        totalLabel.text = String(format:"$%.2f", total)
        
        //Load new theme
        let bgColorNo = (userDefaults.integerForKey("bgColour"))
        switch (bgColorNo) {
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = Double((billField.text! as NSString).doubleValue)
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount + tip
        
   
        tipLabel.text = String(format:"$%.2f", tip)
        
        totalLabel.text = String(format:"$%.2f", total)
    }
    
   
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //VIEW CONTROLLER LIFE CYCLE
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // Load previous data
        let tipPercentage = userDefaults.doubleForKey("tip")
        let tipIndex = userDefaults.integerForKey("ind")
        
        let billAmount = Double((billField.text! as NSString).doubleValue)
        
        tipControl.selectedSegmentIndex = tipIndex
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount + tip
       
        tipLabel.text = String(format:"$%.2f", tip)
        
        totalLabel.text = String(format:"$%.2f", total)
        
       
        //Load new theme
        let bgColorNo = (userDefaults.integerForKey("bgColour"))
        switch (bgColorNo) {
        case 0:
            self.view.backgroundColor = UIColor.redColor()
        case 1:
            self.view.backgroundColor = UIColor.blueColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        default:
            self.view.backgroundColor = UIColor.redColor()
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let billAmount = Double((billField.text! as NSString).doubleValue)
        let tipPercentages = [0.1, 0.15, 0.2]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let index = tipControl.selectedSegmentIndex
        
        
        //Save
        userDefaults.setObject(billAmount, forKey: "bill")
        userDefaults.setObject(tipPercentage, forKey: "tip")
        userDefaults.setInteger(index, forKey: "ind")
        userDefaults.synchronize()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
   
    }
    
}

