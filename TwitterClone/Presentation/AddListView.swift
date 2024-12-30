//
//  AddListView.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import SwiftUI

struct AddListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    var body: some View {
        VStack {
            TextField("", text: $viewModel.editText)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.showModal = false
                }) {
                    Text("キャンセル")
                }
                .buttonStyle(.bordered)
                Spacer()
                Button(action: {
                    let val = TaskEntity(title: viewModel.editText)
                    
                    if !viewModel.editText.isEmpty {
                        Task { @MainActor in
                            viewModel.editText = ""
                        }
                    }
                    viewModel.tasks.append(val)
                    viewModel.showModal = false
                }) {
                    Text("追加")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            .padding()
        }
    }
}

//#Preview {
//    @StateObject var viewModel: ListViewModel = .init()
//    AddListView(viewModel: viewModel)
//}
