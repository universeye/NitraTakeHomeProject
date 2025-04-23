//
//  ChatsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ChatsView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .chats)
            ChatsFilterPickerView()
            Spacer()
            Text("Hello, World!")
            Spacer()
        }
    }
}

#Preview {
    ChatsView()
}
