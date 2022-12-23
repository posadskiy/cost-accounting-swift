//
//  LoginController.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation

class LoginController {
    static let instance = LoginController()

    func successLogin(id: String) {
        UserController.instance.getCurrentUser(userId: id)
    }
    
    func login(credentials: LoginCredentials) {
        LoginService().login(loginCredentials: credentials, onSuccess: self.successLogin)
    }
}
