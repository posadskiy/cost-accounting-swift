//
//  SplitUserView.swift
//  CostAccounting
//
//  Created by Dmitrii on 17.12.2022.
//

import SwiftUI
import Combine

struct SplitUserView: View {
    let userId: String
    let userName: String
    @State var amount: String
    @State var isChecked: Bool

    private let purchaseController = PurchaseController.instance

    var body: some View {
        HStack {
            Text("\(userName)")
            Spacer()
            TextField("amount", text: $amount)
                .keyboardType(.numberPad)
                .onReceive(Just(amount)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.amount = filtered
                    }
                    purchaseController.removePurchase(userId: userId)
                    purchaseController.addPurchase(userId: userId, amount: amount)
                }
                .multilineTextAlignment(.center)
            Toggle(isOn: $isChecked) {}
                .labelsHidden()
                .onChange(of: isChecked) { newValue in
                    if (newValue) {
                        purchaseController.addPurchase(userId: userId, amount: amount)
                    } else {
                        purchaseController.removePurchase(userId: userId)
                    }
                }
        }
    }
}

struct SplitUserView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SplitUserView(userId: "", userName: "Dimitri", amount: "44", isChecked: true)
            SplitUserView(userId: "", userName: "Alina", amount: "44", isChecked: true)
            SplitUserView(userId: "", userName: "Pep", amount: "44", isChecked: true)
            SplitUserView(userId: "", userName: "VeryLongFatherName", amount: "44", isChecked: true)
        }
    }
}
