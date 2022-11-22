//
//  Currency.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import Foundation

enum Currency: String, Codable, CaseIterable, Identifiable {
    case USD, EUR, GBP
    var id: Self { self }
}
