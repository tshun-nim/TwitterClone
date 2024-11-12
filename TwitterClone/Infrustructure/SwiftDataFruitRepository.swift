//
//  SwiftDataFruitRepository.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import Foundation

class SwiftDataFruitRepository: FruitRepository {
    init(){}
    
    func fetchAllFruits() async throws -> [Fruit] {
        let url = URL(string: "")!
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw CustomError.someError
        }
        
        do {
            let fruits = try JSONDecoder().decode([Fruit].self, from: data)
            return fruits
        } catch {
            throw error
        }
    }
    
    func fetchFruit() async throws -> Fruit {
        let url = URL(string: "")!
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw CustomError.someError
        }
        
        do {
            let fruit = try JSONDecoder().decode(Fruit.self, from: data)
            return fruit
        } catch {
            throw error
        }
    }
    
    func addFruit(_ fruit: Fruit) {
        
    }
    
    func deleteFruit(_ fruit: Fruit) {
        
    }
}

enum CustomError: Error {
    case someError
}
