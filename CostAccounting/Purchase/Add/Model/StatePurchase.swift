//
//  StatePurchase.swift
//  CostAccounting
//
//  Created by Dmitrii on 23.12.2022.
//

import Foundation

struct StatePurchase: Codable, Identifiable {
    var id: Int = 0
    var name: String = ""
    var amount: String = "0"
    var category: String = ""
    var currency: Currency = .USD
    var date: Date = Date()
    var isSplit: Bool = false
    
    var users: [User] = []
    
    init(userCount: Int) {
        users = Array(repeating: User(), count: userCount)
    }
    
}
