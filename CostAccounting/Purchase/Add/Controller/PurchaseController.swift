//
//  PurchaseController.swift
//  CostAccounting
//
//  Created by Dmitrii on 20.11.2022.
//

import Foundation

class PurchaseController {
    static func save(purchase: Purchase) -> Void {
        var requestData = PurchaseRequest()
        requestData.purchase = purchase
        let url = URL(string: "http://localhost:8082/money-actions/purchase/add")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            var encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let jsonData = try encoder.encode(requestData)
            let jsonString = String(data: jsonData, encoding: .utf8)!
            print(jsonString)
            //request.httpBody = try? JSONSerialization.data(withJSONObject: purchase)
            request.httpBody = jsonString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print("error \(error)")
                    return
                }
                
                // Parse JSON data
                if let data = data {
                    print("data \(data)")
                    print("response \(response!)")
                    
                }
            })
            
            task.resume()
        } catch {
            print(error)
        }
    }
}
