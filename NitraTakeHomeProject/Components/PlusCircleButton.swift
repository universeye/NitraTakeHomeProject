//
//  PlusCircleButton.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct PlusCircleButton: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .padding(9)
                .background(Colors.mainAccent)
                .clipShape(Circle())
        }
    }
}

#Preview {
    PlusCircleButton()
}
