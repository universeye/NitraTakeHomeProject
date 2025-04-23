//
//  CustomAlertView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct CustomAlertView: View {
    let title: String
    let message: String
    let buttonTitle: String
    let buttonAction: () -> Void

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "exclamationmark.circle.fill")
                .font(.largeTitle)
                .bold()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.black, .yellow)
            Text(title)
                .font(.headline)
            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Button {
                buttonAction()
            } label: {
                Label(buttonTitle, systemImage: "arrow.clockwise")
                    .foregroundStyle(.white)
                    .bold()
            }
            .buttonStyle(.mainButton)
            .padding(.top, 8)
        }
        .padding()
        .padding(.horizontal, 8)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(Colors.secondaryAccent, lineWidth: 0.5)
        }
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 4)
    }
}

#Preview {
    CustomAlertView(title: "Error", message: "This is a custom alert view.", buttonTitle: "Try again", buttonAction: {})
}
