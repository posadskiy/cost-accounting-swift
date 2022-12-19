//
//  Project.swift
//  CostAccounting
//
//  Created by Dmitrii on 19.12.2022.
//

import Foundation
import SwiftUI

final class Project: ObservableObject {
    @Published var projectUsers: [User] = []//StorageUtils.load("project.json")
}
