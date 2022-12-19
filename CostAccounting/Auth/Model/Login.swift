//
//  Login.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation

struct Login: Hashable, Codable {
    var needsAuthentication: Bool
    var isAuthenticating: Bool
    var userId: String
}
