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
        var result : Double = 0.0
        print("Operator : \(operatorInput)")
        switch operatorInput
    
    {
        case "+" : result = rounder(result: numberOne + numberTwo )
        case "-" : result = rounder(result: numberOne - numberTwo )
        case "*" : result = rounder(result: numberOne * numberTwo )
    case "/" : do{
        if(numberTwo == 0.0) { return nil }
        result = rounder(result: numberOne / numberTwo )
        }
        default   : print("Logically code should never reach here")
    }
        return result
    }
    
    func rounder(result : Double) -> Double
    {
        print("Incoming result : \(result)")
        let resultString = String(result)
        if(resultString.count > 11 )
        {
            print(String(format: "%.2f",result),"This is re")
        }
        return result
    }/*8*/
    //-19999999998.0  Going out of Display
    //19999999998
    //1.9999999998
    // Largest Possible number code can think of : 9.999999998e+19
    // Smallest possible positive code can think of : 1.0000000000999999e-22
    // Smallest possible positive code can think of -9.999999998e+19
    
}
