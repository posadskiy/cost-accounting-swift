//
//  LoginService.swift
//  CostAccounting
//
//  Created by Dmitrii on 17.12.2022.
//

import Foundation

class LoginService {
    func login(loginCredentials: LoginCredentials, onSuccess: @escaping (_: String) -> Void) -> Void {
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
            request.httpBody = jsonString.data(using: .utf8)
            
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                if let error = error {
                    print("error \(error)")
                    return
                }
                
                // Parse JSON data
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        let user = try jsonDecoder.decode(LoginCredentials.self, from: data)
                        print(user)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            onSuccess(user.id)
                        }
                    }
                    catch {
                        print("Couldn't login: \(error)")
                    }
                    
                }
            })
            
            task.resume()
        } catch {
            print(error)
        }
    }
}
