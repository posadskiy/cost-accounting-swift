//
//  UserService.swift
//  CostAccounting
//
//  Created by Dmitrii on 12.12.2022.
//

import Foundation

class UserSerivce: ObservableObject {
    @Published var currentUser: User
    
    init() {
        self.currentUser = User()
    }
    
    func getUser(userId: String) -> Void {
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
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.currentUser = user
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
