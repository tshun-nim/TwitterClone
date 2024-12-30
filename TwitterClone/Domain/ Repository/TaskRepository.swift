//
//  TaskRepository.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/12/16.
//

import Foundation

protocol TaskRepository {
    func saveTask(task: TaskEntity) async throws -> Void
    func fetchTasks() async throws -> [TaskEntity]
    func deleteTask(task: TaskEntity) async throws -> Void
    func updateTask(task: TaskEntity) async throws -> Void
}
