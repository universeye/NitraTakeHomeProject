//
//  ChipCellView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/23.
//

import SwiftUI

struct ChipCellView: View {
    let type: ChipType
    @Binding var selectedType: ChipType
    
    var body: some View {
        Text(type.rawValue)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .font(.system(size: 14, weight: selectedType == type ? .semibold : .regular))
            .foregroundStyle(selectedType == type ? Colors.mainColor : Colors.secondaryText)
            .background(selectedType == type ? Color.white : Colors.mainColor)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(selectedType == type ? Color.white : Colors.secondaryAccent)
            }
            .onTapGesture {
                withAnimation {
                    selectedType = type
                }
            }
    }
}

#Preview {
    ChipCellView(type: .all, selectedType: .constant(.investers))
}
