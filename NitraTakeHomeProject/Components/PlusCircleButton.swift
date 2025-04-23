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
                .bold()
                .foregroundStyle(.white)
                .padding(10)
                .background(Colors.mainAccent)
                .cornerRadius(20)
        }
    }
}

#Preview {
    PlusCircleButton()
}
