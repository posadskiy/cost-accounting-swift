//
//  AddPurchasePage.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import SwiftUI

struct AddPurchasePage: View {
    @EnvironmentObject var userController: UserController
    @EnvironmentObject var projectController: ProjectController
    @EnvironmentObject var purchaseController: PurchaseController
    @EnvironmentObject var currencyController: CurrencyController
    @EnvironmentObject var categoryController: CategoryController

    @StateObject var purchase: StatePurchase = StatePurchase()

    var body: some View {
        ScrollView {
            Text("Welcome, \(userController.currentUser.name)")
                .padding(.bottom)
            
            Text("New purchase")
                .bold()
            VStack {
                Text("Category")
                HStack {
                    ForEach(categoryController.categories) { category in
                        if let appleIcon = category.appleIcon {
                            let isSelected = purchase.category == category.id
                            
                            Button() {
                                purchase.category = category.id
                            } label: {
                                Image(systemName: appleIcon)
                                    .foregroundColor(isSelected ? .yellow : .blue)
                                    .imageScale(.large)
                            }
                        }
                    }
                }
            }
            VStack {
                Text("Name")
                TextField(
                    "Purchase name",
                    text: $purchase.name
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            }
            VStack {
                Text("Amount")
                TextField(
                    "How much it was?",
                    text: $purchase.amount
                )
                .keyboardType(.numberPad)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            }
            VStack {
                Text("Currency")
                Picker("Currency", selection: $purchase.currency) {
                    ForEach(currencyController.currencies, id: \.self) { currency in
                        Text(currency).tag(currency)
                    }
                }
            }
            VStack {
                Text("Date")
                DatePicker(
                    "Start Date",
                    selection: $purchase.date,
                    displayedComponents: [.date]
                )
            }
            VStack {
                Toggle(isOn: $purchase.isSplit) {
                    Text("Split")
                }
                .onChange(of: purchase.isSplit) { newValue in
                    if (newValue) {
                        purchaseController.addPurchase(userId: userController.currentUser.id, amount: purchase.amount)
                    } else {
                        purchaseController.clearPurchase()
                    }
                }
                if (purchase.isSplit) {
                    SplitUserView(userId: userController.currentUser.id, userName: userController.currentUser.name, amount: purchase.amount, isChecked: true)
                        ForEach(projectController.projectUsers) { user in
                            SplitUserView(userId: user.id, userName: user.name, amount: "0", isChecked: false)
                        }
                }
            }
            HStack {
                Button("Save") {
                    purchaseController.savePurchase(purchase: self.purchase.toPurchase())
                }
                Button("Clear") {
                    clearPurchase()
                }
            }
        }
        .padding()
    }
    
    func clearPurchase() -> Void {
        self.purchase.clear()
    }
}

struct AddPurchasePage_Previews: PreviewProvider {
    
    static var previews: some View {
        AddPurchasePage()
            .environmentObject(ProjectController())
            .environmentObject(UserController())
            .environmentObject(PurchaseController())
            .environmentObject(CurrencyController(currencies: ["USD", "EUR"]))
            .environmentObject(CategoryController(categories: [
                Category(id: "0", name: "Travel", emoji: "travel", appleIcon: "globe.americas", projectId: "0"),
                Category(id: "1", name: "Phone", emoji: "phone", appleIcon: "phone", projectId: "0"),
            ]))
    }
}
