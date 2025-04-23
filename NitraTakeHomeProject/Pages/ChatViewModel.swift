//
//  ChatViewModel.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import Foundation

class ChatsViewModel: ObservableObject {
    @Published var selectedChipType: ChipType = .all
    @Published var chatMessages: [ChatModel] = []
    var allMessages: [ChatModel] = []
    
    @MainActor
    func filterMessages(by chipType: ChipType) {
        self.chatMessages = allMessages.filter { message in
            guard let contact = MockContacts.getContactById(message.contactId) else {
                return true
            }
            
            switch chipType {
                case .all:
                    return true
                case .unread:
                    return message.isUnread
                case .investers:
                    return contact.type == .invester
                case .clients:
                    return contact.type == .client
            }
        }
    }
    
    @MainActor
    func fetchMessages() async {
        do {
            let chatMessages = try await MockChatService.fetchChats()
            self.chatMessages = chatMessages
            self.allMessages = chatMessages
        } catch {
            print("Error fetching messages: \(error)")
        }
    }
}

