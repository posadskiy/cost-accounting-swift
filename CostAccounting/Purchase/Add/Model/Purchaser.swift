//
//  Purchaser.swift
//  CostAccounting
//
//  Created by Dmitrii on 11.12.2022.
//

import Foundation

struct Purchaser: Identifiable, Codable {
    var id: Int = 0
    var name: String = ""
    var amount: Double = 0
}
