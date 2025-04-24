//
//  EventsView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct EventsView: View {
    private let currentPage: PagesType = .events
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: currentPage)
            Spacer()
            Text(currentPage.title).bold()
            Spacer()
        }
    }
}

#Preview {
    EventsView()
}
