//
//  MoreView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct MoreView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .more)
            Form {
                Section {
                    Toggle(isOn: $settingsManager.isClearAllChats) {
                        Label("Clear all chats", systemImage: "trash")
                            .foregroundColor(.red)
                    }
                    .tint(Colors.tintGreen)
                } footer: {
                    HStack {
                        Spacer()
                        VStack {
                            Icons.NitraLogo
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .padding(.vertical, 16)
                            Text("© 2025 Nitra")
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    MoreView()
        .environmentObject(SettingsManager())
}
