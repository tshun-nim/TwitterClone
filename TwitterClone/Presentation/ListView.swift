//
//  ListView.swift
//  TwitterClone
//
//  Created by 田島隼也 on 2024/11/12.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel: ListViewModel = .init()
    
    var body: some View {
        VStack {
            // リスト一覧
            List(viewModel.tasks) { task in
                Text(task.title)
            }
            .listStyle(.inset)
            
            // 新規作成ボタン
            HStack {
                Spacer()
                Button(action: {
                    viewModel.showModal = true
                }) {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
            }
            .padding()
        }
        .padding()
        .sheet(isPresented: $viewModel.showModal) {
            AddListView(viewModel: viewModel)
        }
    }
}

#Preview {
    @Previewable @StateObject var viewModel: ListViewModel = .init()
    ListView(viewModel: viewModel)
}
