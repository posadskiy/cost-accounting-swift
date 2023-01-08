//
//  Purchase.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import Foundation

struct Purchase: Codable, Identifiable {
    var id: Int = 0
    var category: Category = Category()
    var name: String = ""
    var amount: Double = 0
    var date: Date = Date()
    var currency: String = "EUR"
    var isPrivate: Bool = false
    
    init() {}
    
    init(from: Purchase) {
        self.id = from.id
        self.category = from.category
        self.name = from.name
        self.amount = from.amount
        self.date = from.date
        self.currency = from.currency
        self.isPrivate = from.isPrivate
    }
}
