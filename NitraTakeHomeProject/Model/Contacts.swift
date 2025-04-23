//
//  Contacts.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import Foundation

struct MockContacts {
    static let contacts: [Contact] = [
            Contact(id: "TerryKuo", displayName: "Terry Kuo", currentOnlineStatus: .online, type: .myself),
            Contact(id: "VinodKhosla", displayName: "Vinod Khosla", currentOnlineStatus: .online, type: .client),
            Contact(id: "MarcAndreessen", displayName: "Marc Andreessen", currentOnlineStatus: .offline, type: .invester),
            Contact(id: "BarbaraCorcoran", displayName: "Barbara Corcoran", currentOnlineStatus: .offline, type: .client),
            Contact(id: "BarackObama", displayName: "Barack Obama", currentOnlineStatus: .offline, type: .invester),
            Contact(id: "PeterThiel", displayName: "Peter Thiel", currentOnlineStatus: .offline, type: .invester),
            Contact(id: "LisaSu", displayName: "Lisa Su", currentOnlineStatus: .offline, type: .client)
        ]
}
