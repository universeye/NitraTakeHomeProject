//
//  CalendarView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct CalendarView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .calendar)
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    CalendarView()
}
