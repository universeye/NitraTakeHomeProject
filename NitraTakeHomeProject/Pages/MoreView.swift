//
//  MoreView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .more)
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    MoreView()
}
