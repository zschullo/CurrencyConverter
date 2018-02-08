//
//  CurrencyRateModel.swift
//  LP3_currencyConverter_zschullo
//
//  Created by Zachary Schullo on 12/4/17.
//  Copyright © 2017 assignment2 Zachary Schullo. All rights reserved.
//

import UIKit

let USDollar = "US Dollar"
let Euro = "Euro"
let BritishPound = "British Pound"
let Yen = "Japanese Yen"

class CurrencyRateModel: NSObject {
    
    static func exchangeRates(fromCurrency:String, toCurrency:String) -> Double {
        
        let conversionRates = [USDollar: [Euro:0.84, BritishPound:0.74, Yen:112.51],
                               Euro: [USDollar:1.19, BritishPound:0.88, Yen:133.62],
                               BritishPound: [USDollar:1.35, Euro:1.13, Yen:151.58],
                               Yen: [USDollar:0.0089, Euro:0.0076, BritishPound:0.0066]]
        
        return conversionRates[fromCurrency]![toCurrency]!
    }
}
