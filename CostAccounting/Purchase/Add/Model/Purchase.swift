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
    var currency: Currency = .USD
    var isPrivate: Bool = false
}
