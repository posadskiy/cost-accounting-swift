//
//  PurchaseController.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import Foundation

class PurchaseController: ObservableObject {
    static let instance = PurchaseController()

    var splittedPurchases = Dictionary<String, InputPurchase>()
    
    func addPurchase(userId: String, amount: String) -> Void {
        let purchase = InputPurchase(userId: userId, amount: amount)
        self.splittedPurchases[userId] = purchase
        print("add purchase, count: \(splittedPurchases.count)")
    }
    
    func removePurchase(userId: String) {
        self.splittedPurchases.removeValue(forKey: userId)
        print("remove purchase, count: \(splittedPurchases.count)")
    }
    
    func clearPurchase() {
        splittedPurchases.removeAll()
    }
    
    func savePurchase(purchase: Purchase) {
        if (splittedPurchases.isEmpty) {
            PurchaseService.save(purchase: purchase, userId: UserController.instance.currentUser.id)
        } else {
            splittedPurchases.forEach { (key: String, value: InputPurchase) in
                if (!value.isSelected) {
                    return
                }

                var purchase = Purchase(from: purchase)
                print(value.amount)
                purchase.amount = Double(value.amount)!
                PurchaseService.save(purchase: purchase, userId: value.userId)
            }
        }
    }
}
