//
//  ChatMessageCellView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct ChatMessageCellView: View {
    let message: ChatModel
    
    var contact: Contact {
        return MockContacts.getContactById(message.contactId) ?? MockContacts.contacts[0]
    }
    
    var isSenderSelf: Bool {
        return message.lastMessageSenderId == MockContacts.contacts[0].id
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 12) {
                Image(contact.id)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    .overlay(alignment: .bottomTrailing) {
                        if contact.currentOnlineStatus == .online {
                            Image(systemName: "circle.fill")
                                .font(.system(size: 10))
                                .foregroundStyle(Colors.tintGreen)
                                .overlay {
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                }
                        }
                    }
                VStack(alignment: .leading) {
                    HStack {
                        Text(contact.displayName)
                            .font(.system(size: 16, weight: .semibold))
                        message.messageType.image
                            .resizable()
                            .frame(width: 18, height: 18)
                        Spacer()
                        Text("12:00 PM")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        HStack(spacing: 4) {
                            
                            if isSenderSelf {
                                switch message.lastMessage {
                                case .text:
                                    Text("You:")
                                default:
                                    Text("You")
                                }
                            }
                            Text(message.lastMessage.valueString)
                        }
                        .font(.system(size: 14, weight: message.isUnread ? .semibold : .regular))
                        .foregroundColor(message.isUnread ? .primary : Colors.secondaryAccent)
                        .lineLimit(1)
                        .frame(maxWidth: 225, alignment: .leading)
                        if message.isUnread {
                            Spacer()
                            Image(systemName: "circle.fill")
                                .font(.system(size: 8))
                        }
                    }
                    
                }
            }
            if let suggestions = message.suggestions {
                Text(suggestions)
                    .font(.system(size: 14, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 60)
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
    }
}

#Preview {
    ChatMessageCellView(
        message: .init(
            id: UUID(),
            contactId: "MarcAndreessen",
            lastMessage: .text(message: "Can you send me your availability this week?"),
            lastMessageTime: Date(),
            lastMessageSenderId: "TerryKuo",
            isUnread: false,
            messageType: .SMS
        )
    )
}
