//
//  PurchaseRequest.swift
//  CostAccounting
//
//  Created by Dmitrii on 22.11.2022.
//

import Foundation

struct PurchaseRequest: Codable, Identifiable {
    var id: Int = 0
    var userId: String = ""
    var purchaseId: String = ""
    var purchase: Purchase = Purchase()
}
