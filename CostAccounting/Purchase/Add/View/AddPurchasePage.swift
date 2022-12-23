//
//  AddPurchasePage.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import SwiftUI

struct AddPurchasePage: View {
    @State private var purchase: StatePurchase = StatePurchase(userCount: 0)
    
    @EnvironmentObject var userController: UserController
    @EnvironmentObject var projectController: ProjectController

    var body: some View {
        ScrollView {
            Text("Welcome, \(userController.currentUser.name)")
                .padding(.bottom)
            
            Text("New purchase")
                .bold()
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
                Picker(selection: $purchase.currency, label: Text("Picker")) {
                    Text("USD").tag(Currency.USD)
                    Text("EUR").tag(Currency.EUR)
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
                if (purchase.isSplit) {
                    SplitUserView(name: userController.currentUser.name, amount: purchase.amount, isChecked: true)
                        ForEach(projectController.projectUsers) { user in
                            SplitUserView(name: user.name, amount: "0", isChecked: false)
                        }
                }
            }
            HStack {
                Button("Save") {
                    PurchaseController.save(purchase: preparePurchase())
                }
                Button("Clear") {
                    clearPurchase()
                }
            }
        }
        .padding()
    }
    
    func preparePurchase() -> Purchase {
        return Purchase(id: 0, category: Category(), name: purchase.name, amount: Double(purchase.amount)!, date: purchase.date, currency: purchase.currency, isPrivate: false)
    }
    
    func clearPurchase() -> Void {
        self.purchase = StatePurchase(userCount: 0)
    }
}

struct AddPurchasePage_Previews: PreviewProvider {
    
    static var previews: some View {
        AddPurchasePage()
            .environmentObject(ProjectController())
            .environmentObject(UserController())
    }
}
