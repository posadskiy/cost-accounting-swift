//
//  ProjectService.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation

class ProjectService {

    func getAllUsersByProject(projectId: String, currentUserId: String, onSuccess: @escaping (_: [String], _: String) -> Void) {
        let url = URL(string: "http://localhost:8084/projects/project/all-users-in-project/\(projectId)")
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
                    let users = try jsonDecoder.decode([String].self, from: data)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        onSuccess(users, currentUserId)
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
