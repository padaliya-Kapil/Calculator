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
    var numberOneActive = true //checks if we're taking input for number one
    
    var numberTwo : Double = 0.0
    var numberTwoActive = false //checks if we're taking input for number two
    
    var operationSelected = ""

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
        
        if(self.displayText.contains("-"))
        {
            maximumAllowedLength = 11
        }
        if(self.displayText.contains("."))
        {
            if(self.displayText.contains("-"))
            {
                maximumAllowedLength = 13
            }
            maximumAllowedLength = 12
        }
        if(self.displayText.count < maximumAllowedLength )
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
 
    @IBAction func operatorButton(_ sender: UIButton) {
        
        self.operationSelected = (sender.titleLabel?.text)!
        if(numberOneActive && self.displayText.count > 0)
        {
            numberOne = Double(displayText)!
            print(numberOne)
            self.displayText = ""
            setDisplayLabel(stringToBeDisplayed: self.displayText)
            self.numberOneActive = false
            self.numberTwoActive = true
        }
        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        if(self.numberTwoActive && displayText.count != 0)
        {
            self.numberTwo = Double(displayText)!
            print(self.numberTwo)
            
        let operations = Operations()
            
            print("number One : \(self.numberOne)")
            print("number Two : \(self.numberTwo)")
            
            let result  = operations.calculateValue(numberOne : self.numberOne , numberTwo : self.numberTwo , operatorInput : self.operationSelected)
        print(result)
       
        
            self.numberOne = result
            
            self.numberTwo = 0.0
            self.numberTwoActive = true
            setDisplayLabel(stringToBeDisplayed: String(result))
            self.displayText = ""
        }
        
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        self.displayText = ""
         
         self.numberOne = 0.0
         self.numberOneActive = true //checks if we're taking input for number one
         
         self.numberTwo = 0.0
         self.numberTwoActive = false //checks if we're taking input for number two
        setDisplayLabel(stringToBeDisplayed: "0")
     }
    
    func setDisplayLabel(stringToBeDisplayed : String)
    {
        self.displayLabel.text = stringToBeDisplayed
    }
    
    //Toggles plus minus in display of number
    @IBAction func plusMinusToggle(_ sender: UIButton) {
         if(self.displayText.contains("-"))
         {
             self.displayText.remove(at: self.displayText.startIndex)
         }else{
             self.displayText.insert("-", at: self.displayText.startIndex)
         }
         setDisplayLabel(stringToBeDisplayed: displayText)
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
    
    @IBAction func dotButton(_ sender: UIButton) {
        if(self.displayText.count == 0)
        {
            self.displayText = "0."
        }else if(self.displayText == "-")
        {
            self.displayText = "-0."
        } else if (!self.displayText.contains("."))
        {
            self.displayText.append(".")
        }
        setDisplayLabel(stringToBeDisplayed: self.displayText)
    }
}
