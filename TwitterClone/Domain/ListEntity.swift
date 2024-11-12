//
//  ListEntity.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import Foundation

final class Fruit: Identifiable, Codable {
    var name: String // 名前
    var id = UUID() // 識別するためのIDを生成
    
    init(name: String) {
        self.name = name
    }
}
