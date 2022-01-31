//
//  Callogic.swift
//  SwiftUi_MyCalculator
//
//  Created by Chuljin Hwang on 2022/01/31.
//

import Foundation

class Callogic{
    var digit1 : Double? = nil
    var digit2 : Double? = nil
    var calResult : Double? = nil
    var rememberSymbol : String? = nil
    
    func logic() -> Double?{
        switch rememberSymbol {
        case "+":
            calResult = digit1! + digit2! //강제 언래핑
        case "-":
            calResult = digit1! - digit2!
        case "+-":
            calResult = -digit1!
        case "%":
            calResult = digit1! * 0.01
        default:
            break
        }
        return calResult
    }
     
}
