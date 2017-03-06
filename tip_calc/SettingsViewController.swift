//
//  SettingsViewController.swift
//  tip_calc
//
//  Created by Deniz Tumer on 3/5/17.
//  Copyright © 2017 Deniz Tumer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tip10PercentButton: UIButton!
    @IBOutlet weak var tip15PercentButton: UIButton!
    @IBOutlet weak var tip20PercentButton: UIButton!
    @IBOutlet weak var tip25PercentButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tip10PercentButton.addTarget(self, action: #selector(SettingsViewController.onTouchSetTip(sender:)), for: .touchUpInside)
        tip15PercentButton.addTarget(self, action: #selector(SettingsViewController.onTouchSetTip(sender:)), for: .touchUpInside)
        tip20PercentButton.addTarget(self, action: #selector(SettingsViewController.onTouchSetTip(sender:)), for: .touchUpInside)
        tip25PercentButton.addTarget(self, action: #selector(SettingsViewController.onTouchSetTip(sender:)), for: .touchUpInside)
    }
    
    func onTouchSetTip(sender: UIButton) {
        if let title = sender.titleLabel?.text {
            let tip = title.substring(to: title.index(title.startIndex, offsetBy: 2))
            
            defaults.set(Int(tip), forKey: "tip_calc_percent")
            defaults.synchronize()
            
            self.navigationController?.popViewController(animated: true)
        }
    }
}
