//
//  ClassicCalculatorTests.swift
//  ClassicCalculatorTests
//
//  Created by Jake Johnson on 6/18/20.
//  Copyright © 2020 Jake Johnson. All rights reserved.
//

import XCTest

class ClassicCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDisplayFormula() {
        var calc = Calculation()
        calc.inputDigit(2)
        calc.performOperation(Operator("+")!)
        calc.inputDigit(2)
        calc.performOperation(Operator("=")!)
        XCTAssert(calc.value == 4.0)
        calc.clearAll()
        calc.inputDigit(6)
        calc.performOperation(Operator("÷")!)
        calc.inputDigit(2)
        calc.performOperation(Operator("=")!)
        XCTAssert(calc.value == 3.0)
    }
}
