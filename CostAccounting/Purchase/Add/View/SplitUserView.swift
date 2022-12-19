//
//  SplitUserView.swift
//  CostAccounting
//
//  Created by Dmitrii on 17.12.2022.
//

import SwiftUI
import Combine

struct SplitUserView: View {
    let name: String
    @State var amount: String
    @State var isChecked: Bool
    
    var body: some View {
        HStack {
            Text("\(name)")
            Spacer()
            TextField("amount", text: $amount)
                .keyboardType(.numberPad)
                .onReceive(Just(amount)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.amount = filtered
                    }
                }
                .multilineTextAlignment(.center)
            Toggle(isOn: $isChecked) {}
                .labelsHidden()
        }
    }
}

struct SplitUserView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SplitUserView(name: "Dimitri", amount: "44", isChecked: true)
            SplitUserView(name: "Alina", amount: "44", isChecked: true)
            SplitUserView(name: "Pep", amount: "44", isChecked: true)
            SplitUserView(name: "VeryLongFatherName", amount: "44", isChecked: true)
        }
    }
}
