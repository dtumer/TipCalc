//
//  Extensions.swift
//  tip_calc
//
//  Created by Deniz Tumer on 3/6/17.
//  Copyright © 2017 Deniz Tumer. All rights reserved.
//

import Foundation

//extension on float to be able to convert to currency
extension Float {
    var asCurrency: String {
        let format = NumberFormatter()
        
        format.numberStyle = .currency
        format.locale = Locale.current
        
        return format.string(from: NSNumber(value: self))!
    }
    
    var asPercent: String {
        return "\(self)%"
    }
}

extension String {
    var asUniversalFloat: String {
        return self.replacingOccurrences(of: ",", with: ".")
    }
}
