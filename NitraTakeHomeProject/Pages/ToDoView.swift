//
//  ToDoView.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct ToDoView: View {
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(currentPage: .toDo)
            Spacer()
            Text("To-Do")
            Spacer()
        }
    }
}

#Preview {
    ToDoView()
}
