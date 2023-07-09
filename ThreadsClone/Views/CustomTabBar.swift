//
//  CustomTabBar.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: ThreadsContentView.Tab

    var body: some View {
        HStack(spacing: -24) {
            TabBarButton(tab: .home, imageName: "house", selectedTab: $selectedTab)

            Spacer()

            TabBarButton(tab: .search, imageName: "magnifyingglass", selectedTab: $selectedTab)

            Spacer()

            TabBarButton(tab: .edit, imageName: "pencil", selectedTab: $selectedTab)

            Spacer()

            TabBarButton(tab: .favorite, imageName: "heart", selectedTab: $selectedTab)

            Spacer()

            TabBarButton(tab: .profile, imageName: "person", selectedTab: $selectedTab)
        }
        .padding(.vertical, 8)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.01), radius: 2, x: 0, y: -2)
        .edgesIgnoringSafeArea(.bottom)
    }
}
