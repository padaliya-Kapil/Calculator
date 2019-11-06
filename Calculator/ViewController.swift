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
        sender.alpha = 0.5
               _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
               {
                (timer)
                in
        var maximumAllowedLength = 10
        if(self.displayText.count == 1 && self.displayText == "0" && ((sender.titleLabel?.text)!) == "0")
        {
            sender.alpha = 1
            return
        }
        if(self.displayText.count == 2 && self.displayText == "-0" && ((sender.titleLabel?.text)!) == "0")
        {
            sender.alpha = 1
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
                self.setDisplayLabel(stringToBeDisplayed : self.displayText)
                return
            }
            self.displayText.append((sender.titleLabel?.text)!)
        }
                self.setDisplayLabel(stringToBeDisplayed : self.displayText)
                sender.alpha = 1
                                
                              }
    }
    
//    -0.0123456789
 
    @IBAction func operatorButton(_ sender: UIButton) {
        sender.alpha = 0.5
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
        {
         (timer)
         in
        
        if((sender.titleLabel?.text)! == "%" )
        {
            if(self.numberOneActive && self.displayText.count > 0)
            {
                self.numberOne = Double(self.displayText)!/100.0
                self.displayText = String(self.numberOne)
                self.setDisplayLabel(stringToBeDisplayed: self.displayText)
                
            }
            if(self.numberTwoActive && self.displayText.count > 0)
            {
                self.numberTwo = Double(self.displayText)!/100.0
                self.displayText = String(self.numberTwo)
                self.setDisplayLabel(stringToBeDisplayed: self.displayText)
            }
            sender.alpha = 1
              
            return
        }
        
        self.operationSelected = (sender.titleLabel?.text)!
            if(self.numberOneActive && self.displayText.count > 0)
        {
            self.numberOne = Double(self.displayText)!
            print(self.numberOne)
            self.displayText = ""
            self.setDisplayLabel(stringToBeDisplayed: self.displayText)
            self.numberOneActive = false
            self.numberTwoActive = true
        }
            sender.alpha = 1
                            
                          }

        
    }
    
    @IBAction func equalButton(_ sender: UIButton) {
        sender.alpha = 0.5
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
               {
                (timer)
                in

                if(self.numberTwoActive && self.displayText.count != 0)
        {
            self.numberTwo = Double(self.displayText)!
            print(self.numberTwo)
            
        let operations = Operations()
            
            print("number One : \(self.numberOne)")
            print("number Two : \(self.numberTwo)")
            
            if let result  = operations.calculateValue(numberOne : self.numberOne , numberTwo : self.numberTwo , operatorInput : self.operationSelected)
            {
                self.numberOne = result
                print(result)
                self.setDisplayLabel(stringToBeDisplayed: String(result))
                self.numberTwo = 0.0
                self.numberTwoActive = true
                self.displayText = ""
            }else
            {
                self.setDisplayLabel(stringToBeDisplayed: String("error"))
                self.displayText = ""
                
                self.numberOne = 0.0
                self.numberOneActive = true //checks if we're taking input for number one
                
                self.numberTwo = 0.0
                self.numberTwoActive = false //checks if we're taking input for number two
            }
                
            
        }
                sender.alpha = 1
                  
                }
        
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        sender.alpha = 0.5
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
             {
              (timer)
              in
        self.displayText = ""
         
         self.numberOne = 0.0
         self.numberOneActive = true //checks if we're taking input for number one
         
         self.numberTwo = 0.0
         self.numberTwoActive = false //checks if we're taking input for number two
                self.setDisplayLabel(stringToBeDisplayed: "0")
                sender.alpha = 1
                                 
                               }
     }
    
    func setDisplayLabel(stringToBeDisplayed : String)
    {
        self.displayLabel.text = stringToBeDisplayed
        
    }
    
    //Toggles plus minus in display of number
    @IBAction func plusMinusToggle(_ sender: UIButton) {
        sender.alpha = 0.5
               _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
                    {
                     (timer)
                     in
         if(self.displayText.contains("-"))
         {
             self.displayText.remove(at: self.displayText.startIndex)
         }else{
             self.displayText.insert("-", at: self.displayText.startIndex)
         }
                        self.setDisplayLabel(stringToBeDisplayed: self.displayText)
                        sender.alpha = 1
                          
                        }
     }
    
    @IBAction func backSpaceButton(_ sender: UIButton) {
        sender.alpha = 0.5
                      _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
                           {
                            (timer)
                            in
         if(self.displayText.count == 0)
         {
            self.setDisplayLabel(stringToBeDisplayed: "0")
         }
         if(self.displayText.count > 0)
         {
             self.displayText = String(self.displayText.dropLast())
            self.setDisplayLabel(stringToBeDisplayed: self.displayText)}
                            sender.alpha = 1
                                                     
                                                   }
     }
    
    @IBAction func dotButton(_ sender: UIButton) {
        sender.alpha = 0.5
        _ = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)
             {
              (timer)
              in
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
                self.setDisplayLabel(stringToBeDisplayed: self.displayText)
                sender.alpha = 1
                                                                    
                                                                  }
    }
}
