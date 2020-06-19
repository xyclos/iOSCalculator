//
//  Calculation.swift
//  ClassicCalculator
//
//  Created by Jake Johnson on 6/18/20.
//  Copyright © 2020 Jake Johnson. All rights reserved.
//

import Foundation

enum Operator {
    case mul
    case div
    case mod
    case plu
    case sub
    case equ
    init?(_ symbol: String) {
        switch symbol {
        case "×":
            self = .mul
        case "÷":
            self = .div
        case "%":
            self = .mod
        case "+":
            self = .plu
        case "-":
            self = .sub
        case "=":
            self = .equ
        default:
            return nil
        }
    }
}

struct Calculation {
    var value: Double? = nil
    var displayValue = "0"
    var currentOperator: Operator? = nil
    var waitingForOperand = false
    
    let CalculatorOperations = [
        Operator.div: {(prevValue: Double, nextValue: Double) -> Double in
            return prevValue / nextValue
        },
        Operator.mul: {(prevValue: Double, nextValue: Double) -> Double in
            return prevValue * nextValue
        },
        Operator.plu: {(prevValue: Double, nextValue: Double) -> Double in
            return prevValue + nextValue
        },
        Operator.sub: {(prevValue: Double, nextValue: Double) -> Double in
            return prevValue - nextValue
        },
        Operator.equ: {(prevValue: Double, nextValue: Double) -> Double in
            return nextValue
        },
    ]
    
    mutating func inputDigit(_ d: Int) {
        if waitingForOperand {
            displayValue = String(d)
            waitingForOperand = false
        } else {
            displayValue = displayValue == "0" ? String(d) : displayValue + String(d)
        }
    }
    
    mutating func performOperation(_ nextOperator: Operator) {
        guard let inputValue = Double(displayValue) else {
            return
        }
        
        if value == nil {
            value = inputValue
        } else if let o = currentOperator {
            let currentValue = value ?? 0
            let newValue = CalculatorOperations[o]!(currentValue, inputValue)
            value = newValue
            displayValue = String(newValue)
        }
        
        waitingForOperand = true
        currentOperator = nextOperator
    }
    
    mutating func inputDot() {
        if !displayValue.contains(".") {
            displayValue = "\(displayValue)."
            waitingForOperand = false
        }
    }
    
    mutating func inputPercent() {
        guard let currentValue = Double(displayValue) else {
            return
        }
        
        if currentValue == 0 {
            return
        }
        
        if let newValue = Double(displayValue) {
            displayValue = String((newValue / 100))
        }
    }
    
    mutating func clearLastChar() {
        displayValue = String(displayValue.dropLast())
    }
    
    mutating func clearAll() {
        value = nil
        displayValue = "0"
        currentOperator = nil
        waitingForOperand = false
    }
    
    mutating func clearDisplay() {
        displayValue = "0"
    }
}
