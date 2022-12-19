//
//  CostAccountingApp.swift
//  CostAccounting
//
//  Created by Dmitrii on 14.11.2022.
//

import SwiftUI

@main
struct CostAccountingApp: App {
    @StateObject private var userController = UserController()
    @StateObject private var projectController = ProjectController()
    
    var body: some Scene {
        WindowGroup {
            AddPurchasePage()
                .fullScreenCover(isPresented: $userController.currentUserNotLoaded) {
                    LoginPage()
                        .environmentObject(userController)
                }
                .environmentObject(userController)
                .environmentObject(projectController)
        }
    }
}
