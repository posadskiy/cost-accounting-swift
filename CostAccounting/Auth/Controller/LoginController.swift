//
//  LoginController.swift
//  CostAccounting
//
//  Created by Dmitrii on 22.11.2022.
//

import Foundation

class LoginController {
    func login(loginCredentials: LoginCredentials) -> Void {
        var isUserLogged = LoginService.login(loginCredentials: loginCredentials)
        print(isUserLogged)
        print(LoginService.user)
    }
}
