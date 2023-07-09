//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 0) {
            ThreadsContent()
                .background(Color(UIColor.systemBackground))
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct ThreadsContent: View {
    let threads = GenerateThreadData.generate()
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
            ScrollView {
                LazyVStack {
                    HStack {
                        Image("threadlogo")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                    ForEach(threads) { thread in
                        ThreadCard(thread: thread)
                        Divider()
                            .foregroundColor(Color.gray.opacity(0.1))
                    }
                }
                .padding()
            }.padding(.top, 1)
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: ThreadsContent.Tab
    
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

struct TabBarButton: View {
    let tab: ThreadsContent.Tab
    let imageName: String
    @Binding var selectedTab: ThreadsContent.Tab
    
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

struct ThreadCard: View {
    @State private var showSheet = false
    @State private var isLiked = false
    
    let thread: Thread
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(thread.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(thread.name)
                        .font(.headline)
                    if thread.isVerified {
                        Image("quality")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    Spacer()
                    Text(thread.time)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Button(action: { showSheet = true }) {
                        Image("more")
                            .padding(.leading, 8)
                    }
                }
                .padding(.bottom, 2)
                
                Text(thread.message)
                    .padding(.bottom, 4)
                
                if let messagePhoto = thread.messagePhoto {
                    Image(messagePhoto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 200)
                        .cornerRadius(16)
                        .border(Color.gray.opacity(0.4), width: 2)
                        .padding(.bottom, 4)
                }
                
                HStack(spacing: 16) {
                    LikeButton(isLiked: $isLiked)
                    IconButton(imageName: "comment", rotation: .degrees(0))
                    IconButton(imageName: "retweet", rotation: .degrees(180))
                    IconButton(imageName: "send", rotation: .degrees(-45))
                }
                .padding(.bottom, 8)
                .padding(.top, 4)
                
                HStack(spacing: 8) {
                    Text("164 replies")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text("99 likes")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.trailing, 8)
        }
        .padding(.vertical, 8)
        .sheet(isPresented: $showSheet) {
            MoreBottomSheet(showSheet: $showSheet)
        }
    }
}

struct LikeButton: View {
    @Binding var isLiked: Bool
    
    var body: some View {
        Button(action: { isLiked.toggle() }) {
            ZStack {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 24, height: 22)
                    .foregroundColor(isLiked ? .red : .black)
            }
        }
        .font(Font.system(size: 20).weight(.semibold))
    }
}

struct MoreBottomSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showSheet: Bool

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            MoreBottomSheetContent(showSheet: $showSheet) // Pass the showSheet binding to the MoreBottomSheetContent
                .background(Color(UIColor.systemBackground))
                .cornerRadius(20)
        }
        .presentationDetents([.height(270)])
        .presentationDragIndicator(.visible)
        .frame(alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MoreBottomSheetContent: View {
    @Binding var showSheet: Bool // Add the showSheet binding

    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.1))
                .overlay(
                    VStack(spacing: 0) {
                        Button(action: { showSheet = false }) { // Use the showSheet binding to dismiss the sheet
                            Text("Unfollow")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, minHeight: 16)
                                .padding()
                                .background(Color.clear)
                                .contentShape(Rectangle())
                        }

                        Divider().padding(0)

                        Button(action: { showSheet = false }) { // Use the showSheet binding to dismiss the sheet
                            Text("Mute")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, minHeight: 16)
                                .padding()
                                .background(Color.clear)
                                .contentShape(Rectangle())
                        }
                    }
                )
                .padding(.horizontal, 22)

            Divider().padding(16)

            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        VStack(spacing: 0) {
                            Button(action: { showSheet = false }) {
                                Text("Hide")
                                    .fontWeight(.semibold)
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 16)
                                    .background(Color.clear)
                                    .contentShape(Rectangle())
                            }

                            Divider()

                            Button(action: {}) {
                                Text("Report")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 16)
                                    .background(Color.clear)
                                    .contentShape(Rectangle())
                            }
                        }
                    )
                    .padding(.horizontal, 22)
            }
            Spacer(minLength: 16)
        }
    }
}

struct IconButton: View {
    let imageName: String
    let rotation: Angle
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .rotationEffect(rotation)
    }
}

struct Thread: Identifiable {
    let id: Int
    let name: String
    let isVerified: Bool
    let time: String
    let message: String
    let profileImage: String
    let messagePhoto: String?
}

struct GenerateThreadData {
    static func generate() -> [Thread] {
        return [
            Thread(
                id: 1,
                name: "Okkama",
                isVerified: false,
                time: "2h",
                message: "Prepare to Be Captivated: Unveiling Our Unforgettable New Song, Embracing the Rhythm of Your Soul!",
                profileImage: "okkama",
                messagePhoto: "iyallah"
            ),
            Thread(
                id: 2,
                name: "Elon Musk",
                isVerified: true,
                time: "3h",
                message: "Just tried the 'clone of a clone' app. Not impressed. Originality is key and innovation drives progress. Stick with the real deal, folks. #AuthenticityMatters #InnovationOverImitation",
                profileImage: "elon",
                messagePhoto: "thr"
            ),
            Thread(
                id: 3,
                name: "Bruce Melodie",
                isVerified: false,
                time: "13m",
                message: "Get ready to embark on an exhilarating musical journey like never before! We are thrilled to announce that our highly anticipated new song is on the horizon, poised",
                profileImage: "bruce",
                messagePhoto: nil
            )
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
}
