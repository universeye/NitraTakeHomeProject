//
//  ContentView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            ToDoView()
                .tabItem {
                    Icons.toDoIcon
                        .renderingMode(.template)
                        .foregroundStyle(.primary)
                    Text(PagesType.toDo.title)
                }
                .tag(0)
            EventsView()
                .tabItem {
                    Icons.eventsIcon
                        .renderingMode(.template)
                        .foregroundStyle(.primary)
                    Text(PagesType.events.title)
                }
                .tag(1)
            ChatsView()
                .tabItem {
                    Icons.selectedChatsIcon
                        .renderingMode(.template)
                        .foregroundStyle(.primary)
                    Text(PagesType.chats.title)
                }
                .tag(2)
            CalendarView()
                .tabItem {
                    Icons.calendarIcon
                        .renderingMode(.template)
                        .foregroundStyle(.primary)
                    Text(PagesType.calendar.title)
                }
                .tag(3)
            MoreView()
                .tabItem {
                    Icons.ellipsisIcon
                        .renderingMode(.template)
                        .foregroundStyle(.primary)
                    Text(PagesType.more.title)
                }
                .tag(4)
        }
        .accentColor(Colors.mainAccentWithDarkMode)
    }
}

#Preview {
    ContentView()
        .environmentObject(SettingsManager())
}
