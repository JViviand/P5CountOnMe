//
//  CountOnMe.swift
//  CountOnMe
//
//  Created by Jeremy viviand on 01/03/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calcul {
    
    var calculText = ""
    
    var elements: [String] {
        return calculText.split(separator: " ").map { "\($0)" }
    }
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
    }
    
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "÷"
        
    }
    
    var expressionHaveResult: Bool {
        return calculText.firstIndex(of: "=") != nil
    }
    
    var divisionZero: Bool {
        return !calculText.contains("÷ 0")
    }
   
    func addNumber(number: String) {
        if expressionHaveResult {
            calculText = ""
        }
        calculText.append(number)
    }
    func additionOperator() {
        if canAddOperator {
            calculText.append(" + ")
        }
    }
    func substractionOperator() {
        if canAddOperator {
            calculText.append(" - ")
        }
    }
    func multiplicateOperator() {
        if canAddOperator {
            calculText.append(" x ")
        }
    }
    func divideOperator() {
        if canAddOperator {
            calculText.append(" ÷ ")
        }
    }
    func equalOperator() {
        guard expressionIsCorrect else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard expressionHaveEnoughElement else {
            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
    }
    func resetOperator() {
        calculText = ""
    }
    
    func operators() {
        // Create local copy of operations
    var operationsToReduce = elements
    
    // Iterate over operations while an operand still here
    while operationsToReduce.count > 1 {
    let left = Int(operationsToReduce[0])!
    let operand = operationsToReduce[1]
    let right = Int(operationsToReduce[2])!
    
    let result: Int
    switch operand {
    case "+": result = left + right
    case "-": result = left - right
    default: fatalError("Unknown operator !")
    }
    
    operationsToReduce = Array(operationsToReduce.dropFirst(3))
    operationsToReduce.insert("\(result)", at: 0)
    }
    
    calculText.append(" = \(operationsToReduce.first!)")
    }
}
