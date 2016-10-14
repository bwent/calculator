//
//  ViewController.swift
//  Calculator
//
//  Created by Bridget Went on 7/27/16.
//  Copyright © 2016 Bridget Went. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet private weak var display: UILabel!
    
    private var userTyping = false
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        
        if (userTyping) {
          let textInDisplay = display.text!
          display!.text = textInDisplay + digit
        } else {
          display!.text! = digit
        }
        userTyping = true
    
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction private func clear(sender: UIButton) {
        display!.text! = "0"
        userTyping = false
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(sender: UIButton) {
        if (userTyping) {
            brain.setOperand(displayValue)
            userTyping = false
        }
        if let mathSymbol = sender.currentTitle {
            print(mathSymbol)
            brain.performOperation(mathSymbol)
        }
        displayValue = brain.result
        
    }
   
    
    

}

