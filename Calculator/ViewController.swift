//
//  ViewController.swift
//  Something
//
//  Created by MacStudent on 2019-10-30.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberOne : Double = 0.0
    var numberOnePositive = false
    var numberOneHasDot = false
    
    var numberTwo : Double = 0.0
    var numberTwoPositive = false
    var numberTwoHasDot = false

    @IBOutlet weak var MainPage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numericButton(_ sender: UIButton) {
        print(sender.titleLabel)
        
    }
    
    
}

