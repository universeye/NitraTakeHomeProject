//
//  ChatsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ChatsView: View {
    @StateObject var viewModel = ChatsViewModel()
    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .chats)
            
            if viewModel.chatMessages.isEmpty {
                EmtyChatsView()
            } else {
                ChatsFilterPickerView(viewModel: viewModel)
                
                ScrollView {
                    ForEach(viewModel.chatMessages, id: \.self) { message in
                        ChatMessageCellView(message: message)
                    }
                }
            }   
        }
        .task {
//            guard !viewModel.isLoading else { return }
            guard settingsManager.isClearAllChats == false else { return }
            await viewModel.fetchMessages()
        }
        .onChange(of: viewModel.selectedChipType) { oldValue, newValue in
            withAnimation(.bouncy) {
                viewModel.filterMessages(by: newValue)
            }
        }
        .onChange(of: settingsManager.isClearAllChats) { oldValue, newValue in
            if newValue {
                viewModel.chatMessages = []
            } else {
                viewModel.chatMessages = viewModel.allMessages
            }
        }
    }
}

#Preview {
    ChatsView()
        .environmentObject(SettingsManager())
}
