//
//  ViewController.swift
//  ClassicCalculator
//
//  Created by Jake Johnson on 6/18/20.
//  Copyright © 2020 Jake Johnson. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculator: Calculation!

    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var inputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator = Calculation()
        updateUI()
    }


    @IBAction func handleButton(_ sender: Any) {
        guard let sender = sender as? UIButton else {
            return
        }
        
        guard let buttonText = sender.titleLabel?.text else {
            return
        }
        
        handleInput(buttonText)
        updateUI()
    }
    
    func handleInput(_ i: String) {
        if i == "C" {
            if calculator.displayValue == "0" {
                calculator.clearAll()
            } else {
                calculator.clearDisplay()
            }
        } else if let o = Operator(i) {
            calculator.performOperation(o)
        } else if let d = Int(i) {
            calculator.inputDigit(d)
        } else if i == "." {
            calculator.inputDot()
        } else if i == "%" {
            calculator.inputPercent()
        }
    }
    
    func updateUI() {
        print("display value: \(calculator.displayValue)")
        print("value: \(calculator.value)")
        displayLabel.text = ""
        inputLabel.text = calculator.displayValue
    }
}

