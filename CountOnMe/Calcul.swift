//
//  Calcul.swift
//  Calcul
//
//  Created by Jeremy viviand on 01/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
class Calcul {
    
    var calculText = ""
    var displayAlert: ((String) -> Void)?
    
    var elements: [String] {
        return calculText.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
        
    }
    
    var expressionHaveResult: Bool {
        return calculText.firstIndex(of: "=") != nil
    }
    
    var divisionZero: Bool {
        return !calculText.contains("/ 0")
    }
   
    func addNumber(number: String) {
        if expressionHaveResult {
            calculText = ""
        }
        calculText.append(number)
    }
    func addOperator(_operator: String){
        if canAddOperator {
            calculText.append(" \(_operator) ")
        } else {
            displayAlert?("Un operateur est déja mis !")
        }
    }
    func equalOperator() {
        guard expressionIsCorrect else {
            displayAlert?("Entrez une expression correcte !")
            return
        }
        
        guard expressionHaveEnoughElement else {
            displayAlert?("Démarrer un calcul !")
            return
        }
        operators()
    }
    func resetOperator() {
        calculText = ""
    }
    func divideZero(left: Int, right: Int,_operator: String){
        if _operator == "/" && right == 0 {
            displayAlert?("Démarrer un nouveau calcul !")
        }
    }
    
    // operator
    func operators() {
        // Create local copy of operations
    var operationsToReduce = operatorMultiDivide(expression: elements)
    
    // Iterate over operations while an operand still here
    while operationsToReduce.count > 1 {
    let left = Int(operationsToReduce[0])!
    let operand = operationsToReduce[1]
    let right = Int(operationsToReduce[2])!

    let result: Int
    switch operand {
    case "+": result = left + right
    case "-": result = left - right
    default: return
        //fatalError("Unknown operator !")
    }
    
    operationsToReduce = Array(operationsToReduce.dropFirst(3))
    operationsToReduce.insert("\(result)", at: 0)
    }
    
    calculText.append(" = \(operationsToReduce.first!)")
    }
    func operatorMultiDivide (expression: [String]) -> [String] {
        var operationToReduce = expression
        while operationToReduce.firstIndex(of: "x") != nil || operationToReduce.firstIndex(of: "/") != nil {
            let operandIndex = operationToReduce.firstIndex(of: "x") ?? operationToReduce.firstIndex(of: "/")!
            
            let leftSide = Float(operationToReduce[operandIndex-1])!
            let rightSide = Float(operationToReduce[operandIndex+1])!
            let operand = operationToReduce[operandIndex]
            
            let result: String
            if operand == "x"{
                result = Float(leftSide*rightSide).cleanValue
            } else {
                divideZero(left: Int(leftSide), right: Int(rightSide), _operator: "/")
                result = Float(leftSide/rightSide).cleanValue
                
            }
            
            operationToReduce[operandIndex] = result
            operationToReduce.remove(at: operandIndex-1)
            operationToReduce.remove(at: operandIndex)
        }
        return operationToReduce
    }
}

