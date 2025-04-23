//
//  ButtonStyle+Ext.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct MainButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .background(Colors.mainAccent)
                .clipShape(.rect(cornerRadius: 10))
                .scaleEffect(configuration.isPressed ? 1.1 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
}

extension ButtonStyle where Self == MainButton {
    static var mainButton: MainButton { .init() }
}
