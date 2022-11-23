//
//  Login.swift
//  CostAccounting
//
//  Created by Dmitrii on 22.11.2022.
//

import Foundation

struct LoginCredentials: Identifiable, Codable {
    var id: String = ""
    var email: String = ""
    var password: String? = ""
}
