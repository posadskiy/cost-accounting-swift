//
//  LoginPage.swift
//  CostAccounting
//
//  Created by Dmitrii on 22.11.2022.
//

import SwiftUI

struct LoginPage: View {
    @State private var email: String = ""
    @State private var password: String = ""

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
                    LoginController().login(loginCredentials: prepareCredentials())
                }
                Button("Clear") {
                    clearPurchase()
                }
            }
        }
    }
    
    func clearPurchase() -> Void {
        self.email = ""
        self.password = ""
    }
    
    func prepareCredentials() -> LoginCredentials {
        return LoginCredentials(id: "", email: self.email, password: self.password)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
