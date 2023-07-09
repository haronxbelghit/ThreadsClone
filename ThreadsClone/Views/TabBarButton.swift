//
//  TabBarButton.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation
import SwiftUI

struct TabBarButton: View {
    let tab: ThreadsContentView.Tab
    let imageName: String
    @Binding var selectedTab: ThreadsContentView.Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 4) {
                Image(systemName: imageName)
                    .font(.system(size: 24))
                    .foregroundColor(selectedTab == tab ? .black : .gray)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
