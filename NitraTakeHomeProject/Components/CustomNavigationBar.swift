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
        HStack(spacing: 20) {
            Icons.ellipsisIcon
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            Text(currentPage.title)
                .font(.title)
            Spacer()
            
            if currentPage == .chats {
                Icons.magnifyingglassIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Icons.editIcon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
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
