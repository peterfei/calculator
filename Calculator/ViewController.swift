//
//  ViewController.swift
//  Calculator
//
//  Created by peterfei on 16/9/2.
//  Copyright © 2016年 hey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var enterControl: UILabel!

    var userIsInTheMiddleOfTypingNumber = false
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingNumber {
             enterControl.text =  enterControl.text!+digit
        }else{
            enterControl.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
//        print("input digit = \(digit)")
        
        
    }
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        operandStack.append(displayValue)
        print("operandStack is \(operandStack)")
    }
    
    var displayValue:Double{
        get{
            return NSNumberFormatter().numberFromString(enterControl.text!)!.doubleValue
        }
        set{
            enterControl.text = "\(newValue)"
        }
        
    }
    @IBAction func operate(sender: UIButton) {
        let operate = sender.currentTitle!
        print("current operate is \(operate)")
        switch operate {
        case "+": performOperation({$0+$1})
            
        case "−": performOperation({$1-$0})
        case "×": performOperation({$0*$1})
        case "÷": performOperation({$1/$0})
        default:
            break
        }
    }
    
    func performOperation(operation:(Double, Double) -> Double) {
        if operandStack.count>=2 {
                displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
                print("displayValue is \(displayValue)")
                enter()
            }
    }
    func multiply(op1:Double,op2:Double) -> Double {
        return op1 + op2
    }
}

