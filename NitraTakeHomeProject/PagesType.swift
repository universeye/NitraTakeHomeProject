//
//  PagesType.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

enum PagesType {
    case toDo
    case events
    case chats
    case calendar
    case more
    
    var title: String {
        switch self {
        case .toDo:
            return "To-do"
        case .events:
            return "Events"
        case .chats:
            return "Chats"
        case .calendar:
            return "Calendar"
        case .more:
            return "More"
        }
    }
    
    var index: Int {
        switch self {
        case .toDo:
            return 0
        case .events:
            return 1
        case .chats:
            return 2
        case .calendar:
            return 3
        case .more:
            return 4
        }
    }
    
    var icon: String {
        switch self {
        case .toDo:
            return "to-do"
        case .events:
            return "events-icon"
        case .chats:
            return "chats-icon"
        case .calendar:
            return "calendar-icon"
        case .more:
            return "more-icon"
        }
    }
}
