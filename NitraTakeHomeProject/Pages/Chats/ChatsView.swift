//
//  ChatsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ChatsView: View {
    @StateObject var viewModel = ChatsViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .chats)
            ChatsFilterPickerView(viewModel: viewModel)
                
            ScrollView {
                ForEach(viewModel.chatMessages, id: \.self) { message in
                    ChatMessageCellView(message: message)
                }
            }
        }
        .task {
            await viewModel.fetchMessages()
        }
        .onChange(of: viewModel.selectedChipType) { oldValue, newValue in
            withAnimation(.bouncy) {   
                viewModel.filterMessages(by: newValue)
            }
        }
    }
}

#Preview {
    ChatsView()
}
