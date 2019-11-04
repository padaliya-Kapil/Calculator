//
//  ViewController.swift
//  Something
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayText = ""
    
    var numberOne : Double = 0.0
    var numberOnePositive = true
    var numberOneHasDot = false
    var numberOneActive = true //checks if we're taking input for number one
    
    var numberTwo : Double = 0.0
    var numberTwoPositive = true
    var numberTwoHasDot = false
    var numberTwoActive = false //checks if we're taking input for number two

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDisplayLabel(stringToBeDisplayed: "0")
        
    }
    
    @IBAction func numericButton(_ sender: UIButton) {
        var maximumAllowedLength = 10
        
        if(displayText.contains("-"))
        {
            maximumAllowedLength = 11
        }
        if(displayText.contains("."))
        {
            if(displayText.contains("-"))
            {
                maximumAllowedLength = 13
            }
            maximumAllowedLength = 12
        }
        if(displayText.count < maximumAllowedLength)
        {
            self.displayText.append((sender.titleLabel?.text)!)
        }
        setDisplayLabel(stringToBeDisplayed : self.displayText)
    }
    
//    -0.0123456789
    @IBAction func plusMinusToggle(_ sender: UIButton) {
        if(displayText.contains("-"))
        {
            displayText.remove(at: displayText.startIndex)
        }else{
            displayText.insert("-", at: displayText.startIndex)
            
        }
        setDisplayLabel(stringToBeDisplayed: displayText)
    }
    @IBAction func operatorButton(_ sender: UIButton) {
        print(sender.titleLabel)
    }
    
 
    @IBAction func backSpaceButton(_ sender: UIButton) {
        self.displayText.remove(at: self.displayText.endIndex)
        setDisplayLabel(stringToBeDisplayed: displayText)
    }
    
    @IBAction func pointerButton(_ sender: UIButton) {
    }
    @IBAction func equalButton(_ sender: UIButton) {
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        self.displayText = ""
         
         self.numberOne = 0.0
         self.numberOnePositive = true
         self.numberOneHasDot = false
         self.numberOneActive = true //checks if we're taking input for number one
         
         self.numberTwo = 0.0
         self.numberTwoPositive = true
         self.numberTwoHasDot = false
         self.numberTwoActive = false //checks if we're taking input for number two
        setDisplayLabel(stringToBeDisplayed: "0")
     }
    
    func setDisplayLabel(stringToBeDisplayed : String)
    {
        displayLabel.text = stringToBeDisplayed
    }
     
}

