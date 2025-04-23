//
//  ChatViewModel.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import Foundation

class ChatsViewModel: ObservableObject {
    @Published var chatMessages: [ChatModel] = []
    
    @MainActor
    func fetchMessages() async {
        do {
            let chatMessages = try await MockChatService.fetchChats()
            self.chatMessages = chatMessages
        } catch {
            print("Error fetching messages: \(error)")
        }
    }
}

