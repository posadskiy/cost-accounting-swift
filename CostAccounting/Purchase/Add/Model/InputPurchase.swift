//
//  InputPurchase.swift
//  CostAccounting
//
//  Created by Dmitrii on 23.12.2022.
//

import Foundation

class InputPurchase: Codable, Identifiable, ObservableObject {
    var id: Int = 0
    var userId: String = ""
    var amount: String = ""
    var isSelected: Bool = false
    
    init(userId: String, amount: String) {
        self.userId = userId
        self.amount = amount
        self.isSelected = true
    }
}
