//
//  CustomNavigationBar.swift
//  NitraTakeHomeProject
//
//  Created by Terry Kuo on 2025/4/22.
//

import SwiftUI

struct CustomNavigationBar: View {
    let currentPage: PagesType
    
    var body: some View {
        HStack {
            Image(systemName: "ellipsis")
            
            Text(currentPage.title)
                .font(.title)
            Spacer()
            
            Image(systemName: "ellipsis")
            Image(systemName: "ellipsis")
        }
        .bold()
        .padding()
        .foregroundStyle(.white)
        .background(Color("MainColor"))
    }
}

#Preview {
    CustomNavigationBar(currentPage: .chats)
}
