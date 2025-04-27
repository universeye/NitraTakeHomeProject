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
    private let currentPage: PagesType = .chats
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: currentPage)
            
            mainSection()
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
    
    //MARK: - Main Section
    @ViewBuilder
    private func mainSection() -> some View {
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
            successView()
        case .error(_):
            Spacer()
            CustomAlertView(
                title: viewModel.errorAlertTitle ?? "Error",
                message: viewModel.errorAlertMessage ?? "Something Happened",
                buttonTitle: viewModel.errorAlertButtonTitle,
                buttonAction: viewModel.errorAlertButtonAction ?? {
                })
            .transition(.scale)
            Spacer()
        }
    }
    
    
    //MARK: - Success View
    @ViewBuilder
    private func successView() -> some View {
        if viewModel.chatMessages.isEmpty {
            EmtyChatsView()
        } else {
            ChatsFilterPickerView(viewModel: viewModel)
            
            ScrollView {
                ForEach(viewModel.chatMessages, id: \.self) { message in
                    ChatMessageCellView(message: message)
                }
            }
        }

        if settingsManager.isShowAlertButton {
            Button {
                viewModel.showTestAlert()
            } label: {
            Label("Test alert", systemImage: "exclamationmark.triangle")
                .foregroundColor(.white)
            }
            .buttonStyle(.mainButton)
        }
    }
    
    
}

#Preview {
    ChatsView()
        .environmentObject(SettingsManager())
}
