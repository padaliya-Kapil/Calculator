//
//  Operations.swift
//  Calculator
//
//  Created by Kapil Padaliya on 2019-11-04.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
struct Operations
{
    func calculateValue(numberOne : Double , numberTwo : Double , operatorInput : String) -> Double?
    {
        print("Operator : \(operatorInput)")
        switch operatorInput
    
    {
    
    case "+" : return numberOne + numberTwo
    case "-" : return numberOne - numberTwo
    case "*" : return numberOne * numberTwo
    case "/" : do{
        if(numberTwo == 0.0) { return nil }
        return numberOne / numberTwo
        }
        default   : return nil
    }
    }
    
}
