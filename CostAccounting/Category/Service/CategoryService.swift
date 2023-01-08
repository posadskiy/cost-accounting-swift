//
//  CategoryService.swift
//  CostAccounting
//
//  Created by Dmitrii on 25.12.2022.
//

import Foundation

class CategoryService {
    
    static func getAllCategories(projectId: String, onSuccess: @escaping (_: [Category]) -> Void) {
        let url = URL(string: "http://localhost:8084/projects/project/category/purchase-categories/\(projectId)")
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
                    let currencies = try jsonDecoder.decode([Category].self, from: data)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        onSuccess(currencies)
                    }
                }
                catch {
                    print("Couldn't load categories: \(error)")
                }
                
            }
        })
        
        task.resume()
    }
}
