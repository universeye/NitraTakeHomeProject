//
//  ChatsFilterPickerView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ChatsFilterPickerView: View {
    @ObservedObject var viewModel: ChatsViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 8) {
                ForEach(ChipType.allCases, id: \.self) { type in
                    ChipCellView(type: type, selectedType: $viewModel.selectedChipType)
                }
                PlusCircleButton()
            }
        }
        .scrollClipDisabled()
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .frame(maxWidth: .infinity)
        .background(Colors.mainColor)
    }
    
}

#Preview {
    ChatsFilterPickerView(viewModel: ChatsViewModel())
}
