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
        if(self.displayText.count == 1 && self.displayText == "0" && ((sender.titleLabel?.text)!) == "0")
        {
            return
        }
        if(self.displayText.count == 2 && self.displayText == "-0" && ((sender.titleLabel?.text)!) == "0")
        {
            return
        }
        if(self.displayText.count == 0 && ((sender.titleLabel?.text)!) == "0")
        {
                   return
        }
        
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
        if(displayText.count < maximumAllowedLength )
        {
            // This is a quick fix logic
            if(self.displayText.count == 2 && self.displayText == "-0")
            {
                self.displayText = "-" + (sender.titleLabel?.text)!
                setDisplayLabel(stringToBeDisplayed : self.displayText)
                return
            }
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
        if(self.numberOneActive)
        {
            self.numberOnePositive = false
        }else
        {
            self.numberTwoPositive = false
        }
        setDisplayLabel(stringToBeDisplayed: displayText)
    }
    @IBAction func operatorButton(_ sender: UIButton) {
        print(sender.titleLabel)
    }
    
 
    @IBAction func backSpaceButton(_ sender: UIButton) {
        if(self.displayText.count == 0)
        {
            setDisplayLabel(stringToBeDisplayed: "0")
        }
        if(self.displayText.count > 0)
        {
            self.displayText = String(self.displayText.dropLast())
            setDisplayLabel(stringToBeDisplayed: self.displayText)}
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

