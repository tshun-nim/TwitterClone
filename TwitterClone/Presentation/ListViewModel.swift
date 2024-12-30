//
//  ListViewModel.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var showModal: Bool = false
    @Published var editText: String = ""
    @Published var tasks: [TaskEntity] = []
}
