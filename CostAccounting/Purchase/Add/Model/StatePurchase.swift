//
//  StatePurchase.swift
//  CostAccounting
//
//  Created by Dmitrii on 23.12.2022.
//

import Foundation
import SwiftUI

class StatePurchase: Identifiable, ObservableObject {
    @Published var id: Int = 0
    @Published var name: String = ""
    @Published var amount: String = "0"
    @Published var category: String = ""
    @Published var currency: String = "EUR"
    @Published var date: Date = Date()
    @Published var isSplit: Bool = false

    func clear() {
        self.id = 0
        self.name = ""
        self.amount = "0"
        self.category = ""
        self.currency = "EUR"
        self.date = Date()
        self.isSplit = false
    }
    
    func toPurchase() -> Purchase {
        var purchase = Purchase()

        purchase.id = id
        purchase.category = Category(id: category)
        purchase.name = name
        purchase.amount = Double(amount)!
        purchase.date = date
        purchase.currency = currency
        purchase.isPrivate = false
        
        return purchase
    }
}
