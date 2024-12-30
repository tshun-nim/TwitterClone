//
//  TaskRepositryImpl.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/12/16.
//

import Foundation
import SwiftData

// Infrastructure/Repositories/TaskRepositoryImpl.swift
import Combine
import SwiftUI

@MainActor
final class TaskRepositoryImpl: TaskRepository {
    
    var container: ModelContainer?
//    private let container: ModelContainer
    
    init() {
        self.container = try? ModelContainer(for: TaskEntity.self)
    }
    
    func saveTask(task: TaskEntity) async throws {
        guard let container else {
            throw NSError(domain: "TaskRepositoryImpl", code: 100)
        }
        let context = ModelContext(container)
        context.insert(task)
    }
    
    func fetchTasks() async throws -> [TaskEntity] {
        guard let container else {
            throw NSError(domain: "TaskRepositoryImpl", code: 100)
        }
        
        let context = ModelContext(container)
        do {
            return try context.fetch(FetchDescriptor<TaskEntity>())
        } catch let error {
            throw error
        }
    }
    
    func deleteTask(task: TaskEntity) async throws {
        guard let container else {
            throw NSError(domain: "TaskRepositoryImpl", code: 100)
        }
        let context = ModelContext(container)
        context.delete(task)
    }
    
    func updateTask(task: TaskEntity) async throws {
        guard let container else {
            throw NSError(domain: "TaskRepositoryImpl", code: 100)
        }
        let context = ModelContext(container)
        
        do {
            try context.save()
        } catch let error {
            throw error
        }
    }
}


//class TaskRepositoryImpl: TaskRepository {
//    func updateTask(task: TaskEntity) async throws {
//        
//    }
//    
//    func saveTask(task: TaskEntity) {
//        
//    }
//    
//    func fetchTasks() -> [TaskEntity] {
//        return []
//    }
//    
//    func deleteTask(task: TaskEntity) {
//        
//    }
//}

// Infrastructure/Persistence/SwiftDataTask.swift
@Model
final class SwiftDataTask {
    @Attribute(.unique) var id: UUID
    var title: String
    var isCompleted: Bool
    var createdAt: Date

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, createdAt: Date = Date()) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
    }

    // ドメインモデルへの変換
    func toDomain() -> TaskEntity {
        return TaskEntity(id: id, title: title, isCompleted: isCompleted, createdAt: createdAt)
    }

    // ドメインモデルからの変換
    static func fromDomain(_ task: TaskEntity) -> SwiftDataTask {
        return SwiftDataTask(id: task.id, title: task.title, isCompleted: task.isCompleted, createdAt: task.createdAt)
    }
}
