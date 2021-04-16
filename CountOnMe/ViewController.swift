//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Jeremy Viviand on 01/03/2021.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var calculator = Calcul()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if let numberText = sender.title(for: .normal) {
            calculator.addNumber(number: numberText)
        }
        textView.text = calculator.calculText
    }
    @IBAction func tappedResetOperator(_ sender: UIButton) {
        calculator.resetOperator()
        textView.text = calculator.calculText
    }
    
    @IBAction func tappedDivideOperator(_ sender: UIButton) {
        calculator.addOperator(_operator: "/")
        textView.text = calculator.calculText
    }
    
    @IBAction func tappedMultiplicateOperator(_ sender: UIButton) {
        calculator.addOperator(_operator: "x")
        textView.text = calculator.calculText
    }
    
    @IBAction func tappedSubstractionOperator(_ sender: UIButton) {
        calculator.addOperator(_operator: "-")
        textView.text = calculator.calculText
    }
    
    @IBAction func tappedAdditionOperator(_ sender: UIButton) {
        calculator.addOperator(_operator: "+")
        textView.text = calculator.calculText
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.equalOperator()
        textView.text = calculator.calculText
    }
    func bind() {
        calculator.displayAlert = alert(message:)
    }
    func alert(message: String) {
        let alertVC = UIAlertController(title: "Zéro!", message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
