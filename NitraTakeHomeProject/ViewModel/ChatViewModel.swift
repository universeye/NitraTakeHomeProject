//
//  ChatViewModel.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

class ChatsViewModel: ObservableObject {
    @Published var selectedChipType: ChipType = .all
    @Published var chatMessages: [ChatModel] = []
    @Published var viewState: ViewState = .idle
    @Published var errorAlertTitle: String?
    
    var errorAlertMessage: String? = "Something happened"
    var errorAlertButtonTitle: String = "Try again"
    var errorAlertButtonAction: (() -> Void)?
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
        }.sorted(by: { $0.lastMessageTime > $1.lastMessageTime })
    }
    
    @MainActor
    func fetchMessages() async {
        withAnimation(.smooth(duration: 0.35)) {
            viewState = .loading
        }

        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            let chatMessages = try await MockChatService.fetchChats()
            self.chatMessages = chatMessages.sorted(by: { $0.lastMessageTime > $1.lastMessageTime })
            self.allMessages = chatMessages
            withAnimation(.smooth(duration: 0.35)) {
                viewState = .success
            }
        } catch {
            showErrorAlert(title: "Error", message: "Failed to fetch messages. \(error).", buttonAction: {
                Task {
                    await self.fetchMessages()
                }
            })
            withAnimation(.smooth(duration: 0.35)) {
                viewState = .error(error)
            }
        }
    }

    func showErrorAlert(title: String, message: String, buttonAction: @escaping () -> Void) {
        errorAlertTitle = title
        errorAlertMessage = message
        errorAlertButtonAction = buttonAction
    }

    @MainActor
    func clearErrorAlert() {
        withAnimation(.smooth(duration: 0.3)) {
            errorAlertTitle = nil
            errorAlertMessage = nil
            errorAlertButtonAction = nil
            if allMessages.isEmpty {
                viewState = .idle
            } else {
                viewState = .success
            }
        }
    }

    @MainActor
    func showTestAlert() {
        showErrorAlert(title: "Error", message: "Failed to fetch messages.", buttonAction: {
            self.clearErrorAlert()
        })
        withAnimation(.smooth(duration: 0.3)) {
            viewState = .error(NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch messages."]))
        }
    }
}

