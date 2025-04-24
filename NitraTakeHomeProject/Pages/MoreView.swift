//
//  MoreView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct MoreView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    private let currentPage: PagesType = .more
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: currentPage)
            Form {
                Section {
                    Toggle(isOn: $settingsManager.isClearAllChats) {
                        HStack {
                            Image(systemName: "trash.fill")
                                .foregroundStyle(.red)
                            Text("Clear all chats")
                        }
                    }
                    .tint(Colors.tintGreen)
                    
                    Toggle(isOn: $settingsManager.isShowAlertButton) {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .yellow)
                            Text("Show test alert button")
                        }
                    }
                    .tint(Colors.tintGreen)
                } header: {
                    Text("Debug")
                } footer: {
                    HStack {
                        Spacer()
                        VStack {
                            Icons.NitraLogo
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150)
                                .padding(.vertical, 16)
                            HStack {
                                Text("© 2025 Nitra")
                                Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0") (\(Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"))")
                            }
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
