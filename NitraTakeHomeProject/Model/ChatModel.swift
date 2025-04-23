//
//  ChatModel.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct ChatModel: Hashable, Identifiable {
    static func == (lhs: ChatModel, rhs: ChatModel) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let id: UUID
    let contactId: String
    let lastMessage: MessageType
    let lastMessageTime: Date
    let lastMessageSenderId: String
    var isUnread: Bool
    let messageType: MessagengerType
    var suggestions: String?
}

enum MessageType {
    case text(message: String)
    case image
    case video
    case audio
    case invoice
    
    var valueString: String {
        switch self {
        case .text(let message):
            return message
        case .image:
            return "sent an image"
        case .video:
            return "sent a video"
        case .audio:
            return "sent an audio"
        case .invoice:
            return "sent an invoice"
        }
    }
}

enum MessagengerType {
    case Twigapp
    case SMS
    
    var image: Image {
        switch self {
        case .Twigapp:
            return Icons.twigappIcon
        case .SMS:
            return Icons.smsIcon
        }
    }
}


struct Contact: Identifiable {
    let id: String
    var displayName: String
    var profileImage: String? = nil
    var currentOnlineStatus: OnlineStatus
    let type: ContactType
}

enum OnlineStatus: String {
    case online = "Online"
    case offline = "Offline"
    case busy = "Busy"
}


enum ContactType: String {
    case myself = "Myself"
    case invester = "Investor"
    case client = "Client"
}
