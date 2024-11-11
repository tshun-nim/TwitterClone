//
//  ListEntity.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import Foundation

struct Fruit: Identifiable {
    let name: String // 名前
    let id = UUID() // 識別するためのIDを生成
}
