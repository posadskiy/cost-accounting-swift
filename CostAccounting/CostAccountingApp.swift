//
//  CostAccountingApp.swift
//  CostAccounting
//
//  Created by Dmitrii on 14.11.2022.
//

import SwiftUI

@main
struct CostAccountingApp: App {
    //@StateObject private var modelData = ModelData()
    @StateObject private var authenticator = Authenticator()
    @StateObject private var userService = UserSerivce()
    
    var body: some Scene {
        WindowGroup {
            AddPurchasePage()
                .fullScreenCover(isPresented: $authenticator.needsAuthentication) {
                    LoginPage()
                        .environmentObject(authenticator)
                        .environmentObject(userService)
                }
                .environmentObject(authenticator)
                .environmentObject(userService)
        }
    }
}
