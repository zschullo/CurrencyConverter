//
//  Validator.swift
//  LP3_currencyConverter_zschullo
//
//  Created by Zachary Schullo on 12/4/17.
//  Copyright © 2017 assignment2 Zachary Schullo. All rights reserved.
//

import UIKit

class Validator: NSObject {
    
    static func isDifferent(fromCurrency: String, toCurrency: String) -> Bool {
        
        if (fromCurrency != toCurrency) {
            return true
            
        }
        
        return false
    }
    
    static func isValid(fromCurrencyAmount: String) -> Bool {
        
        if ((Double(fromCurrencyAmount)) != nil) {
            return true
            
        }
        
        return false
    }
}
