//
//  User.swift
//  CostAccounting
//
//  Created by Dmitrii on 12.12.2022.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    var id: String = ""
    var email: String = ""
    var name: String = ""
    var projectId: String = ""
    var defaultCurrency: Currency? = .USD
}
