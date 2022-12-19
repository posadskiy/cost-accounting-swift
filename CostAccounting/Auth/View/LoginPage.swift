//
//  LoginPage.swift
//  CostAccounting
//
//  Created by Dmitrii on 22.11.2022.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = "dmitry.posadsky@gmail.com"
    @State private var password: String = "29708d798cac22170b0165b478495d7800b64c0df5ef24469c7efea4554d8112"
    
    @EnvironmentObject var userController: UserController

    var body: some View {
        ScrollView {
            VStack {
                Text("Email")
                TextField(
                    "username",
                    text: $email
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            }
            VStack {
                Text("Password")
                SecureField(
                    "password",
                    text: $password
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            }
            HStack {
                Button("Save") {
                    login()
                }
                Button("Clear") {
                    clearPurchase()
                }
            }
        }
        .padding()
    }
    
    func clearPurchase() -> Void {
        self.email = ""
        self.password = ""
    }
    
    func prepareCredentials() -> LoginCredentials {
        return LoginCredentials(id: "", email: self.email, password: self.password)
    }
    
    func login() -> Void {
        LoginController(userController: userController).login(credentials: prepareCredentials())
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
