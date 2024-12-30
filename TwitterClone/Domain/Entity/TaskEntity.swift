//
//  Task.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/12/16.
//

import Foundation
import SwiftData

@Model
class TaskEntity {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var createdAt: Date

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }
}
