//
//  UserController.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation

class UserController: ObservableObject {
    static let instance = UserController()

    @Published var currentUser: User = User()//StorageUtils.load("user.json")
    @Published var currentUserNotLoaded: Bool = true
    
    func getCurrentUser(userId: String) {
        UserSerivce().getUser(userId: userId) { user in
            self.currentUser = user
            
            ProjectController.instance.getAllUsersByProject(projectId: user.projectId, currentUserId: user.id)
            
            self.currentUserNotLoaded = false
        }
    }
}
