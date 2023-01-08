//
//  Category.swift
//  CostAccounting
//
//  Created by Dmitrii on 25.12.2022.
//

import Foundation

class Category: Identifiable, Codable {
    var id: String = ""
    var name: String = ""
    var emoji: String = ""
    var appleIcon: String? = ""
    var projectId: String = ""
    var isPurchase: Bool? = false
    var isIncome: Bool? = false
    
    init() {}
    
    init(id: String) {
        self.id = id
    }
    
    init(id: String, name: String, emoji: String, appleIcon: String? = nil, projectId: String, isPurchase: Bool? = nil, isIncome: Bool? = nil) {
        self.id = id
        self.name = name
        self.emoji = emoji
        self.appleIcon = appleIcon
        self.projectId = projectId
        self.isPurchase = isPurchase
        self.isIncome = isIncome
    }
}
