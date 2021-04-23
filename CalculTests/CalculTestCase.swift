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
    override func setUp() {
        super.setUp()
        calculator = Calcul()
    }
    
    func testex(){
        XCTAssert(true)
    }
    // ajout de nombre
    func testGivenStringNumber2_WhenAddingNumber_ThenNumberIsShowed() {
        calculator.addNumber(number: "4")
        XCTAssertEqual(calculator.calculText, "4")
    }
    func testGivenStringNumber2and2_WhenAddingNumbers_ThenNumberIsShowed() {
        calculator.addNumber(number: "2")
        calculator.addNumber(number: "2")
        XCTAssertEqual(calculator.calculText, "22")
    }
    func testGivenStringNumber2AfterReset_WhenAddingNumber_ThenNumberIsShowed() {
        calculator.resetOperator()
        calculator.addNumber(number: "2")
        XCTAssertEqual(calculator.calculText, "2")
    }
    // calcul
    
    func testGivenAddition2and2_WhenCalculIsAsked_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "+")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "2 + 2 = 4")
        
    }
    
    func testGivenSoustraction2and2_WhenCalculIsAsked_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "-")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "2 - 2 = 0")
    }
    
    func testGivenMultiplication2and2_WhenCalculIsAsked_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "x")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "2 x 2 = 4")
    }
    
    func testGivenDivision10and2_WhenCalculIsAsked_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "4")
        calculator.addOperator(_operator: "/")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "4 / 2 = 2")
    }
    // calcul plus compliquer
    func testGivenAdditionAndDivide_WhenAlreadyHaveAResult_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "+")
        calculator.addNumber(number: "4")
        calculator.addOperator(_operator: "/")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "2 + 4 / 2 = 4")
    }
    func testGivensoustractionAndDivide_WhenAlreadyHaveAResult_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "-")
        calculator.addNumber(number: "4")
        calculator.addOperator(_operator: "/")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "2 - 4 / 2 = 0")
    }
    func testGivenAdditionAndMLultiplicate_WhenAlreadyHaveAResult_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "+")
        calculator.addNumber(number: "4")
        calculator.addOperator(_operator: "x")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "2 + 4 x 2 = 10")
    }
    func testGivensoustractionAndMultiplicate_WhenAlreadyHaveAResult_ThenScreenGiveTheResult() {
        calculator.addNumber(number: "10")
        calculator.addOperator(_operator: "-")
        calculator.addNumber(number: "4")
        calculator.addOperator(_operator: "x")
        calculator.addNumber(number: "2")
        calculator.equalOperator()
        XCTAssertEqual(calculator.calculText, "10 - 4 x 2 = 2")
    }
    // erreur test avec deux operateur en meme temps
    
    func testGivenAdditionOperator_WhenScreenDisplayError_ThenScreenDislayError() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "+")
        calculator.addOperator(_operator: "+")
        XCTAssertTrue(calculator.calculText == "")
    }
    func testGivensoustractionOperator_WhenScreenDisplayError_ThenScreenDislayError() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "-")
        calculator.addOperator(_operator: "-")
        XCTAssertTrue(calculator.calculText == "")
    }
    func testGivenMultiplicateOperator_WhenScreenDisplayError_ThenScreenDislayError() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "x")
        calculator.addOperator(_operator: "x")
        XCTAssertTrue(calculator.calculText == "")
    }
    func testGivenDivideOperator_WhenScreenDisplayError_ThenScreenDislayError() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "/")
        calculator.addOperator(_operator: "/")
        XCTAssertTrue(calculator.calculText == "")
    }
    // erreur demarrer un nouveau calcul
    
    func testGivenDivision10By0_WhenCalculIsAsked_ThenScreenReturnError() {
        calculator.addNumber(number: "2")
        calculator.addOperator(_operator: "/")
        calculator.addNumber(number: "0")
        XCTAssertTrue(calculator.calculText == "")
    }
    func testGivenEqual_whenScreenDsiplayError_ThenScreenDisplayError() {
        calculator.addOperator(_operator: "=")
        XCTAssertTrue(calculator.calculText == "")
    }
}
