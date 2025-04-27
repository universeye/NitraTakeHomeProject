//
//  MockChatsService.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//
import Foundation

final class MockChatService {

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }()

    private static func date(from string: String) -> Date {
        return dateFormatter.date(from: string) ?? Date()
    }

    static func fetchChats() async throws -> [ChatModel] {
        let chatModels: [ChatModel] = [
            .init(id: UUID(), contactId: "VinodKhosla", lastMessage: .text(message: "I'll send you my cal"), lastMessageTime: date(from: "2025/04/25 09:41"), lastMessageSenderId: "TerryKuo", isUnread: false, messageType: .Twigapp),
            .init(id: UUID(), contactId: "MarcAndreessen", lastMessage: .text(message: "Can you send me your availability this week?"), lastMessageTime: date(from: "2025/04/25 09:30"), lastMessageSenderId: "MarcAndreessen", isUnread: true, messageType: .SMS),
            .init(id: UUID(), contactId: "BarbaraCorcoran", lastMessage: .text(message: "ok ill book a time with you"), lastMessageTime: date(from: "2025/04/24 09:30"), lastMessageSenderId: "TerryKuo", isUnread: false, messageType: .Twigapp),
            .init(id: UUID(), contactId: "BarackObama", lastMessage: .invoice, lastMessageTime: date(from: "2025/04/20 09:30"), lastMessageSenderId: "TerryKuo", isUnread: false, messageType: .Twigapp, suggestions: "Unpaid invoice. Send a reminder?"),
            .init(id: UUID(), contactId: "PeterThiel", lastMessage: .text(message: "Hey we need to chat about our roadmap"), lastMessageTime: date(from: "2025/04/19 09:30"), lastMessageSenderId: "TerryKuo", isUnread: false, messageType: .SMS, suggestions: "Sent 3 days ago. Follow up?"),
            .init(id: UUID(), contactId: "LisaSu", lastMessage: .text(message: "Happy holidays!"), lastMessageTime: date(from: "2025/04/19 09:30"), lastMessageSenderId: "LisaSu", isUnread: false, messageType: .Twigapp),
        ]
        
        return chatModels
    }
}
