//
//  EmtyChatsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct EmtyChatsView: View {
    var body: some View {
        VStack(spacing: 12) {
            Icons.emptyImage
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.vertical, 12)
            Text("No chats yet")
                .font(.system(size: 20, weight: .semibold))
            Text("Start a new chat to connect with someone.")
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.gray)
            Button {
                
            } label: {
                HStack {
                    Label {
                        Text("New chat")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.white)
                    } icon: {
                        Icons.editIcon
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .background(Colors.mainAccent)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.vertical, 12)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    EmtyChatsView()
}
