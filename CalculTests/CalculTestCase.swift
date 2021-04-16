//
//  CalculTestCase.swift
//  CalculTests
//
//  Created by Jeremy viviand on 16/04/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculTestCase: XCTestCase {
    
    var calculator: Calcul!
    
    func testAdditionOpertion() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "+")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertTrue(calculator.calculText == "2 + 2 = 4")
        
    }
    
    func testSubstractionOperation() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "-")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertTrue(calculator.calculText == "2 - 2 = 0")
    }
    
    func testMultiplicateOperation() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "x")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertTrue(calculator.calculText == "4")
    }
    
    func testDivideOperation() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "/")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertTrue(calculator.calculText == "0")
    }
}
