//
//  ChatModel.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct ChatModel {
    let name: String
    let avatar: Image
    let message: [String]
    let lastMessageTime: String
    var isUnread: Bool
    let messageType: MessageType
}

enum MessageType {
    case Twigapp
    case SMS
}
