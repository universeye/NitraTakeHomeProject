//
//  EventsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct EventsView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .events)
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    EventsView()
}
