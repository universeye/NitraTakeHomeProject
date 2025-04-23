//
//  ContentView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ToDoView()
                .tabItem {
                    Label(PagesType.toDo.title, image: .todoIcon)
                }
            EventsView()
                .tabItem {
                    Label(PagesType.events.title, image: .eventsIcon)
                }
            ChatsView()
                .tabItem {
                    Label(PagesType.chats.title, image: .chatsIcon)
                }
            CalendarView()
                .tabItem {
                    Label(PagesType.calendar.title, image: .calendarIcon)
                }
            MoreView()
                .tabItem {
                    Label(PagesType.more.title, image: .moreIcon)
                }
        }
    }
}

#Preview {
    ContentView()
}
