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
    var tip: Float = 0.0
    var bill: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBillAmountFirstResponder()
        setBillAmountPlaceholder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadDefaultTip()
    }
    
    //sets the bill amount placeholder text
    private func setBillAmountPlaceholder() {
        let billPlaceholder = "Bill Amount"
        
        billAmountTextField.placeholder = billPlaceholder
    }
    
    //sets the keyboard as the first responder for the bill amount
    private func setBillAmountFirstResponder() {
        billAmountTextField.becomeFirstResponder()
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
            if let tip = Float(tipAmountTextField.text!.asUniversalFloat) {
                self.tip = tip
            }
            else {
                print("Error: unable to convert tip amount to a float value")
            }
        }
        
        calculateTip()
    }
    
    @IBAction func setBillAmount(_ sender: Any) {
        bill = 0.0
        
        if (billAmountTextField.text != nil) && !(billAmountTextField.text?.isEmpty)! {
            if let bill = Float(billAmountTextField.text!.asUniversalFloat) {
                self.bill = bill
            }
            else {
                print("Error: unable to convert bill amount to a float value")
            }
        }
        
        calculateTip()
    }
    
    //calculate the tip on every change of the bill amount or tip amount text field
    private func calculateTip() {
        var calc_tip: Float = 0.0
        var calc_total: Float = 0.0
        
        //calculate tip
        calc_tip = self.bill * (self.tip / 100)
        
        //calculate total
        calc_total = self.bill + calc_tip
        
        //set the labels
        tipAmountLabel.text = calc_tip.asCurrency
        billTotalLabel.text = calc_total.asCurrency
    }
}
