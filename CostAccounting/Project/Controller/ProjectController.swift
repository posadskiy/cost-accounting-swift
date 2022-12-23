//
//  ProjectController.swift
//  CostAccounting
//
//  Created by Dmitrii on 17.12.2022.
//

import Foundation

class ProjectController: ObservableObject {
    static let instance = ProjectController()

    @Published var projectUsers: [User] = []//StorageUtils.load("project.json")
    
    func onSuccessGetProjectUser(user: User) {
        self.projectUsers.append(user)
    }
    
    func getAllUsersByProject(projectId: String, currentUserId: String) {
        ProjectService().getAllUsersByProject(projectId: projectId, currentUserId: currentUserId, onSuccess: self.onSuccessGetAllUsersByProject)
    }
    
    func onSuccessGetAllUsersByProject(users: [String], currentUserId: String) {
        for userId in users {
            if (userId != currentUserId) {
                UserSerivce().getUser(userId: userId, onSuccess: self.onSuccessGetProjectUser)
            }
        }
    }
    
}

