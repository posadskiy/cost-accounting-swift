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
    
    var body: some Scene {
        WindowGroup {
            LoginPage()
            //AddPurchasePage()
                //.environmentObject(modelData)
        }
    }
}
