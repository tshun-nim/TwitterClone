//
//  SwiftDataFruitRepository.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import Foundation
import SwiftData
import SwiftUICore

class SwiftDataFruitRepository: FruitRepository {
    @Environment(\.modelContext) var context
    
    init(){}
    
    func fetchAllFruits() -> [Fruit] {
        <#code#>
    }
    
    func addFruit(_ fruit: Fruit) {
        let fruit = Fruit(name: "Hello User \(Date().formatted(date: .numeric, time: .shortened))")
        context.insert(fruit)
        saveContext()
    }
    
    func deleteFruit(_ fruit: Fruit) {
        <#code#>
    }
    
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
