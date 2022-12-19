//
//  UserController.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation

class UserController: ObservableObject {
    @Published var currentUser: User = StorageUtils.load("user.json")
    @Published var currentUserNotLoaded: Bool = false
    
    func getCurrentUser(userId: String) {
        UserSerivce().getUser(userId: userId) { user in
            self.currentUser = user
            
            ProjectController().getAllUsersByProject(projectId: user.projectId, currentUserId: user.id)
            
            self.currentUserNotLoaded = false
        }
    }
}
