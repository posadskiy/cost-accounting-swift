//
//  AddPurchasePage.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import SwiftUI

struct AddPurchasePage: View {
    @State private var name: String = ""
    @State private var amount: String = ""
    @State private var category: String = ""
    @State private var currency: Currency = .USD
    @State private var date: Date = Date()
    @State private var isSplit: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                Text("Name")
                TextField(
                    "Purchase name",
                    text: $name
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            }
            VStack {
                Text("Amount")
                TextField(
                    "How much it was?",
                    text: $amount
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
            }
            VStack {
                Text("Currency")
                Picker(selection: $currency, label: Text("Picker")) {
                    Text("USD").tag(Currency.USD)
                    Text("EUR").tag(Currency.EUR)
                }
            }
            VStack {
                Text("Date")
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
            }
            VStack {
                Toggle(isOn: $isSplit) {
                    Text("Split")
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
    }
    
    func preparePurchase() -> Purchase {
        return Purchase(id: 0, category: Category(), name: name, amount: Double(amount)!, date: date, currency: currency, isPrivate: false)
    }
    
    func clearPurchase() -> Void {
        self.name = ""
        self.amount = ""
        self.currency = .USD
        self.date = Date()
        self.isSplit = false
    }
}

struct AddPurchasePage_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchasePage()
    }
}
