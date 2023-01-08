//
//  UserService.swift
//  CostAccounting
//
//  Created by Dmitrii on 12.12.2022.
//

import Foundation
import SwiftUI

class UserSerivce {
    
    func getUser(userId: String, onSuccess: @escaping (_: User) -> Void) -> Void {
        let url = URL(string: "http://localhost:8085/users/user/v1/\(userId)")
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
                    let user = try jsonDecoder.decode(User.self, from: data)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        onSuccess(user)
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
