//
//  ChatCellRedacted.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct ChatCellRedacted: View {
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 12) {
                Image("BarackObama")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    HStack {
                        Text("contact.displayName")
                            .font(.system(size: 16, weight: .semibold))
                        MessagengerType.Twigapp.image
                            .resizable()
                            .frame(width: 18, height: 18)
                        Spacer()
                        Text("Yesterday")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        HStack(spacing: 4) {
                            Text("message.lastMessage.valueString")
                        }
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Colors.secondaryAccent)
                        .lineLimit(1)
                        .frame(maxWidth: 225, alignment: .leading)
                        Spacer()
                        Image(systemName: "circle.fill")
                            .font(.system(size: 8))
                    }
                    
                }
            }
            Text("suggestions  message.suggestions")
                .font(.system(size: 14, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 60)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 16)

    }
}

#Preview {
    ChatCellRedacted()
}
