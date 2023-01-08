//
//  CurrencyController.swift
//  CostAccounting
//
//  Created by Dmitrii on 25.12.2022.
//

import Foundation

class CurrencyController: ObservableObject {
    static let instance = CurrencyController()
    
    @Published var currencies: [String] = []
    
    init() {}
    
    init(currencies: [String]) {
        self.currencies = currencies
    }
    
    func onLoadCurrenciesSuccess(currencies: [String]) {
        self.currencies = currencies
    }
    
    func loadCurrencies() {
        CurrencyService.getCurrencies(onSuccess: self.onLoadCurrenciesSuccess)
    }
}
