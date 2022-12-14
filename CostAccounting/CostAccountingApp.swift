//
//  CostAccountingApp.swift
//  CostAccounting
//
//  Created by Dmitrii on 14.11.2022.
//

import SwiftUI

@main
struct CostAccountingApp: App {
    @StateObject private var userController = UserController.instance
    @StateObject private var projectController = ProjectController.instance
    @StateObject private var purchaseController = PurchaseController.instance
    @StateObject private var currencyController = CurrencyController.instance
    @StateObject private var categoryContrller = CategoryController.instance
    
    var body: some Scene {
        WindowGroup {
            AddPurchasePage()
                .fullScreenCover(isPresented: $userController.currentUserNotLoaded) {
                    LoginPage()
                        .environmentObject(userController)
                }
                .environmentObject(userController)
                .environmentObject(projectController)
                .environmentObject(purchaseController)
                .environmentObject(currencyController)
                .environmentObject(categoryContrller)
        }
    }
}
