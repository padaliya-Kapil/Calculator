//
//  ViewController.swift
//  Something
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayText = "3"
    
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
        setDisplayLabel(stringToBeDisplayed: self.displayText)
        
    }
    
    @IBAction func numericButton(_ sender: UIButton) {
        
        print(sender.titleLabel)
        
    }
    
    
    @IBAction func operatorButton(_ sender: UIButton) {
        print(sender.titleLabel)
    }
    
 
    @IBAction func backSpaceButton(_ sender: UIButton) {
    }
    
    @IBAction func pointerButton(_ sender: UIButton) {
    }
    @IBAction func equalButton(_ sender: UIButton) {
    }
    
    @IBAction func clearAllButton(_ sender: UIButton) {
        self.displayText = "0"
         
         self.numberOne = 0.0
         self.numberOnePositive = true
         self.numberOneHasDot = false
         self.numberOneActive = true //checks if we're taking input for number one
         
         self.numberTwo = 0.0
         self.numberTwoPositive = true
         self.numberTwoHasDot = false
         self.numberTwoActive = false //checks if we're taking input for number two
        setDisplayLabel(stringToBeDisplayed: self.displayText)
     }
    
    func setDisplayLabel(stringToBeDisplayed : String)
    {
        displayLabel.text = stringToBeDisplayed
    }
     
}

