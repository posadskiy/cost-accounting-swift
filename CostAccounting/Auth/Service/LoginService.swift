//
//  LoginController.swift
//  CostAccounting
//
//  Created by Dmitrii on 22.11.2022.
//

import Foundation

class LoginService {
    private(set) static var user: LoginCredentials? = nil

    static func login(loginCredentials: LoginCredentials) -> Bool {
        let url = URL(string: "http://localhost:8080/auth/login/v1/auth/")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let jsonData = try encoder.encode(loginCredentials)
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
                    do {
                        let jsonDecoder = JSONDecoder()
                        let user = try jsonDecoder.decode(LoginCredentials.self, from: data)
                        self.user = user
                    } catch {
                        print(error)
                    }
                }
            })
            
            task.resume()
        } catch {
            print(error)
        }
        
        return self.user != nil
    }
}
