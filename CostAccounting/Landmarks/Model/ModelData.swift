//
//  ModelData.swift
//  CostAccounting
//
//  Created by Dmitrii on 15.11.2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = StorageUtils.load("landmarkData.json")
}
