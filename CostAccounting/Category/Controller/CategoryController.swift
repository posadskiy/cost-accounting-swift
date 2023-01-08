//
//  CategoryController.swift
//  CostAccounting
//
//  Created by Dmitrii on 25.12.2022.
//

import Foundation

class CategoryController: ObservableObject {
    static let instance = CategoryController()
    private var userController = UserController.instance
    
    @Published var categories: [Category] = []
    
    init() {}

    init (categories: [Category]) {
        self.categories = categories
    }
    
    func onSuccessLoadCategories(categories: [Category]) {
        self.categories = categories
    }
    
    func loadCategories() {
        CategoryService.getAllCategories(projectId: userController.currentUser.projectId, onSuccess: self.onSuccessLoadCategories)
    }
}
