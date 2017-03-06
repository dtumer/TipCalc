//
//  CalculatorViewController.swift
//  tip_calc
//
//  Created by Deniz Tumer on 3/1/17.
//  Copyright © 2017 Deniz Tumer. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    
    //input fields
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountTextField: UITextField!
    
    //output labels
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UILabel!
    
    let defaults = UserDefaults.standard
    
    //stores tip amount
    var tip: Double = 0.0
    var bill: Double = 0.0
    
    //currency symbol
    var currency_symbol = "$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let billPlaceholder = "Bill Amount (\(currency_symbol))"
        
        billAmountTextField.placeholder = billPlaceholder
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadDefaultTip()
    }
    
    //loads a default tip if there's a tip there
    private func loadDefaultTip() {
        if let tip = defaults.object(forKey: "tip_calc_percent") {
            tipAmountTextField.text = String(describing: tip)
            setTipAmount(tipAmountTextField)
        }
    }
    
    @IBAction func setTipAmount(_ sender: Any) {
        tip = 0.0
        
        if (tipAmountTextField.text != nil) && !(tipAmountTextField.text?.isEmpty)! {
            self.tip = Double(tipAmountTextField.text!)!
        }
        
        calculateTip()
    }
    
    @IBAction func setBillAmount(_ sender: Any) {
        bill = 0.0
        
        if (billAmountTextField.text != nil) && !(billAmountTextField.text?.isEmpty)! {
            self.bill = Double(billAmountTextField.text!)!
        }
        
        calculateTip()
    }
    
    //calculate the tip on every change of the bill amount or tip amount text field
    func calculateTip() {
        var calc_tip: Double = 0.0
        var calc_total: Double = 0.0
        
        //calculate tip
        calc_tip = self.bill * (self.tip / 100)
        
        //calculate total
        calc_total = self.bill + calc_tip
        
        //set the labels
        tipAmountLabel.text = formatCurrency(amount: calc_tip)
        billTotalLabel.text = formatCurrency(amount: calc_total)
    }
    
    //formats the text to include currency symbol and two decimal places
    private func formatCurrency(amount: Double) -> String {
        return NSString(format: "\(currency_symbol)%.2f" as NSString, amount) as String
    }
}
