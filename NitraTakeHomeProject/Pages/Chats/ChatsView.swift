//
//  ChatsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ChatsView: View {
    @StateObject var viewModel = ChatsViewModel()
    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .chats)
            
            
            switch viewModel.viewState {
            case .idle:
                Spacer()
            case .loading:
                VStack {
                    ForEach(0...5, id: \.self) { _ in
                        ChatCellRedacted()
                    }
                }
                .redacted(reason: .placeholder)
                
                Spacer()
            case .success:
                if viewModel.chatMessages.isEmpty {
                    EmtyChatsView()
                } else {
                    ChatsFilterPickerView(viewModel: viewModel)
                    
                    ScrollView {
                        ForEach(viewModel.chatMessages, id: \.self) { message in
                            ChatMessageCellView(message: message)
                                .onTapGesture {
                                    withAnimation(.smooth(duration: 0.3)) {
                                        viewModel.showErrorAlert(title: "Error", message: "Failed to fetch messages.", buttonAction: {
                                            viewModel.clearErrorAlert()
                                        })
                                    }
                                    withAnimation(.smooth(duration: 0.3)) {
                                        viewModel.viewState = .error(NSError(domain: "Error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch messages."]))
                                    }
                                }
                        }
                    }
                }
            case .error(_):
                Spacer()
                if let errorAlertTitle = viewModel.errorAlertTitle {
                    CustomAlertView(
                        title: errorAlertTitle,
                        message: viewModel.errorAlertMessage ?? "Something Happened",
                        buttonTitle: viewModel.errorAlertButtonTitle,
                        buttonAction: viewModel.errorAlertButtonAction ?? {
                        })
                    .transition(.scale)
                }
                Spacer()
            }
        }
        .task {
            guard viewModel.viewState != .loading else { return }
            guard settingsManager.isClearAllChats == false else { return }
            guard viewModel.chatMessages.isEmpty else { return }
            await viewModel.fetchMessages()
        }
        .onChange(of: viewModel.selectedChipType) { oldValue, newValue in
            withAnimation(.bouncy) {
                viewModel.filterMessages(by: newValue)
            }
        }
        .onChange(of: settingsManager.isClearAllChats) { oldValue, newValue in
            if newValue {
                viewModel.chatMessages = []
            } else {
                viewModel.chatMessages = viewModel.allMessages
            }
        }
    }
}

#Preview {
    ChatsView()
        .environmentObject(SettingsManager())
}
