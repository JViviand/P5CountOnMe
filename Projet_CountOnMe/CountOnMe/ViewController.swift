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
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        if let numberText = sender.title(for: .normal) {
            calculator.addNumber(number: numberText)
        }
    }
    @IBAction func tappedResetOperator(_ sender: UIButton) {
        calculator.resetOperator()
    }
    
    @IBAction func tappedDivideOperator(_ sender: UIButton) {
        calculator.divideOperator()
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedMultiplicateOperator(_ sender: UIButton) {
        calculator.multiplicateOperator()
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedSubstractionOperator(_ sender: UIButton) {
        calculator.substractionOperator()
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedAdditionOperator(_ sender: UIButton) {
        calculator.additionOperator()
        let alertVC = UIAlertController(title: "Zéro!", message: "Un operateur est déja mis !", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calculator.equalOperator()
    }
    
}
