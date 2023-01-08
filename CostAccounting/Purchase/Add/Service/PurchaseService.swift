//
//  PurchaseService.swift
//  CostAccounting
//
//  Created by Dmitrii on 23.12.2022.
//

import Foundation

class PurchaseService {
    static func save(purchase: Purchase, userId: String) -> Void {
        var requestData = PurchaseRequest()
        requestData.purchase = purchase
        requestData.userId = userId
        let url = URL(string: "http://localhost:8082/money-actions/purchase/add")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let jsonData = try encoder.encode(requestData)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            request.httpBody = jsonString.data(using: .utf8)

            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print("error \(error)")
                }
            })
            
            task.resume()
        } catch {
            print(error)
        }
    }
}
