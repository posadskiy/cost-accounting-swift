//
//  LoginController.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation

class LoginController {
    
    var userController: UserController
    
    init(userController: UserController) {
        self.userController = userController
    }

    func successLogin(id: String) {
        userController.getCurrentUser(userId: id)
    }
    
    func login(credentials: LoginCredentials) {
        LoginService().login(loginCredentials: credentials, onSuccess: self.successLogin)
    }
}
