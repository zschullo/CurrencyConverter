//
//  CurrencyViewController.swift
//  LP3_currencyConverter_zschullo
//
//  Created by Zachary Schullo on 12/4/17.
//  Copyright © 2017 assignment2 Zachary Schullo. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var conversionType: String!
    
    @IBOutlet weak var fromPickerView: UIPickerView!
    @IBOutlet weak var toPickerView: UIPickerView!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var convertCurrency: UIButton!
    
    var fromPickerData: [String] = [String]()
    var toPickerData: [String] = [String]()
    
    var fromPickerKey = 0
    var toPickerKey = 0
    var fromPickerRow = ""
    var toPickerRow = ""
    
    var toPickerRate: Double = 0.0
    var amountToConvert: Double = 0.0
    var convertedAmount: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //Connect Data
        self.fromPickerView.delegate = self
        self.fromPickerView.dataSource = self
        
        self.toPickerView.delegate = self
        self.toPickerView.dataSource = self

        // Do any additional setup after loading the view.
        fromPickerData = ["US Dollar", "Euro", "British Pound", "Japanese Yen"]
        toPickerData = ["Euro", "US Dollar", "British Pound", "Japanese Yen"]
        
        output.layer.cornerRadius = 7
        convertCurrency.layer.borderWidth = 0.5
        convertCurrency.layer.cornerRadius = 7
        
    }
    
    

    @IBAction func convertCurrency(_ sender: Any) {
        
        if(Validator.isDifferent(fromCurrency: fromPickerData[fromPickerKey], toCurrency: toPickerData[toPickerKey])) {
            
            if(Validator.isValid(fromCurrencyAmount: amount.text!)) {
                
                toPickerRate = CurrencyRateModel.exchangeRates(fromCurrency: fromPickerData[fromPickerKey], toCurrency: toPickerData[toPickerKey])
                amountToConvert = Double(amount.text!)!
                
                toPickerRate *= 100
                convertedAmount = (toPickerRate * amountToConvert) / 100
                
                // Bring rate back to original value for display in the following if statement
                toPickerRate /= 100
                
                
                if (toPickerKey == 1) {
                    
                    result.text = "$" + String(format: "%.02f", convertedAmount)
                    output.text = "1 \(fromPickerData[fromPickerKey]) equals \(toPickerRate) \(toPickerData[toPickerKey])s"
        
                } else {
                    
                    result.text = String(convertedAmount)
                    output.text = "1 \(fromPickerData[fromPickerKey]) equals \(toPickerRate) \(toPickerData[toPickerKey])s"
                }
                
            } else {
                
                output.text = "Invalid amount.  Please enter a valid amount in order to convert currencies"
                amount.text = ""
                
            }
        
        } else {
            output.text = "Your conversion types must be different!  Please change at least one currency type."
            amount.text = ""
            
        }
        
    }
    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (pickerView == fromPickerView) {
            return fromPickerData.count
            
        } else {
            return toPickerData.count
            
        }
        
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (pickerView == fromPickerView) {
            return fromPickerData[row]
            
        } else {
            return toPickerData[row]
            
        }
    }
    
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == fromPickerView) {
            fromPickerKey = row;
            
        } else {
            toPickerKey = row;
            
        }
    }

}
