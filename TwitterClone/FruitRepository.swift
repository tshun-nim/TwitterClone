//
//  FruitRepository.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import Foundation

protocol FruitRepository {
    func fetchAllFruits() -> [Fruit]
    func addFruit(_ fruit: Fruit)
    func deleteFruit(_ fruit: Fruit)
}
