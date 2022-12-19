//
//  Authenticator.swift
//  CostAccounting
//
//  Created by Dmitrii on 23.11.2022.
//

import Foundation

class Storage: ObservableObject {

    @Published var userId: String = ""
    @Published var currentUser: User = User()

    
    func successLogin(id: String) {
        self.userId = id
        
        self.getUser(userId: id)
    }
    
    
    
    
    func login(loginCredentials: LoginCredentials) {
        LoginService().login(loginCredentials: loginCredentials, onSuccess: self.successLogin)
    }
    

}
