//
//  ThreadsContentView.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import SwiftUI

struct ThreadsContentView: View {
    @StateObject var viewModel: ThreadViewModel

    @State private var selectedTab: Tab = .home

    enum Tab {
        case home
        case search
        case edit
        case favorite
        case profile
    }

    var body: some View {
        VStack(spacing: 0) {
            if selectedTab == .home {
                ScrollView {
                    LazyVStack {
                        HStack {
                            Image("threadlogo")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        ForEach(viewModel.threadCards) { threadCardViewModel in
                            ThreadCard(viewModel: threadCardViewModel) // Update to use viewModel
                            Divider()
                                .foregroundColor(Color.gray.opacity(0.1))
                        }
                    }
                    .padding()
                }.padding(.top, 1)
            } else {
                ScrollView {
                    LazyVStack {
                        Text(selectedTabString)
                            .font(.title)
                            .padding()
                    }
                }
            }

            CustomTabBar(selectedTab: $selectedTab)
        }
    }

    private var selectedTabString: String {
        switch selectedTab {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .edit:
            return "Edit"
        case .favorite:
            return "Favorite"
        case .profile:
            return "Profile"
        }
    }
}

struct ThreadsContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThreadsContentView(viewModel: ThreadViewModel())
    }
}
