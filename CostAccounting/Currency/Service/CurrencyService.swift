//
//  CurrencyService.swift
//  CostAccounting
//
//  Created by Dmitrii on 25.12.2022.
//

import Foundation

class CurrencyService {
    
    static func getCurrencies(onSuccess: @escaping (_: [String]) -> Void) {
        let url = URL(string: "http://localhost:8082/money-actions/currency/all")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                print("error \(error)")
                return
            }

            // Parse JSON data
            if let data = data {
                let jsonDecoder = JSONDecoder()
                do {
                    let currencies = try jsonDecoder.decode([String].self, from: data)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        onSuccess(currencies)
                    }
                }
                catch {
                    print("Couldn't load user: \(error)")
                }

            }
        })
        
        task.resume()
    }
}
