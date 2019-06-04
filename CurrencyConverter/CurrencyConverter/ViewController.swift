//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Jordan Spell on 6/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

enum CurrencyType {
    case cad
    case peso
}

class ViewController: UIViewController {
    
    
    let cadExchangeRate = 3.0
    let pesoExchangeRate = 2.0
    
    var currencyType: CurrencyType = .cad
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var pesoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //needed to add so that cad was selected on load
        //should be a way to have button already toggled without this line
        cadButton.isSelected.toggle()
    }
    
    func convert(dollars: Double, to unit: CurrencyType) -> Double {
        if currencyType == .cad {
            return dollars * cadExchangeRate
        } else {
            return dollars * pesoExchangeRate
        }
    }
    
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let userInput = fromCurrencyTextField.text, let dollars = Double(userInput) else { return }
        
        if cadButton.isSelected {
            toCurrencyTextField.text = String(convert(dollars: dollars, to: currencyType))
        } else {
            toCurrencyTextField.text = String(convert(dollars: dollars, to: currencyType))
        }
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        toggleCurrency()
    }
    
    @IBAction func pesoButtonPressed(_ sender: Any) {
        toggleCurrency()
    }
    
    func toggleCurrency() {
        cadButton.isSelected.toggle()
        pesoButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currencyType = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            currencyType = .peso
            toCurrencyLabel.text = "Currency (Peso)"
        }
    }
    
}

