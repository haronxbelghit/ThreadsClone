//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ThreadsContent()
            .background(Color(UIColor.systemBackground))
    }
}

struct ThreadsContent: View {
    let threads = GenerateThreadData.generate()
    @State private var showSheet = false
    @State private var columnHeightDp: CGFloat = 0
    
    var body: some View {
        TabView {
            LazyVStack {
                HStack {
                    Image("threadlogo")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                ForEach(threads) { thread in
                    ThreadCard(thread: thread)
                    Divider()
                        .foregroundColor(Color.gray.opacity(0.1))
                }
            }
            .padding()
            .onPreferenceChange(ColumnHeightPreferenceKey.self) { columnHeight in
                columnHeightDp = columnHeight
            }
            .tabItem {
                Image(systemName: "house")
            }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            
            Text("Edit")
                .tabItem {
                    Image(systemName: "pencil")
                }
            
            Text("Favorite")
                .tabItem {
                    Image(systemName: "heart")
                }
            
            Text("Profile")
                .tabItem {
                    Image(systemName: "person")
                }
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct ThreadCard: View {
    @State private var showSheet = false
    @State private var columnHeightPx: CGFloat = 0
    
    let thread: Thread
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(thread.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            Spacer()
                .frame(width: 2, height: columnHeightPx - 70)
                .background(Color.gray.opacity(0.4))
                .alignmentGuide(.bottom) { d in d[VerticalAlignment.bottom] }
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 2) {
                    Text(thread.name)
                        .font(.headline)
                    if thread.isVerified {
                        Image("quality")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                }
                HStack(spacing: 8) {
                    Text(thread.time)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                    Button(action: { showSheet = true }) {
                        Image("more")
                    }
                }
                Text(thread.message)
                if let messagePhoto = thread.messagePhoto {
                    Image(messagePhoto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 200)
                        .cornerRadius(16)
                        .border(Color.gray.opacity(0.4), width: 2)
                }
                HStack(spacing: 0) {
                    IconButton(imageName: "favorite", rotation: Angle.degrees(0))
                    IconButton(imageName: "comment", rotation: .degrees(180))
                    IconButton(imageName: "retweet", rotation: .degrees(180))
                    IconButton(imageName: "send", rotation: .degrees(-45))
                }
                HStack(spacing: 8) {
                    Text("164 replies")
                        .foregroundColor(.gray)
                    Text("99 likes")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.vertical, 8)
        .onPreferenceChange(ColumnHeightPreferenceKey.self) { columnHeight in
            columnHeightPx = columnHeight
        }
        .sheet(isPresented: $showSheet) {
            MoreBottomSheet()
        }
    }
}

struct MoreBottomSheet: View {
    var body: some View {
        // Your bottom sheet content
        Text("More Bottom Sheet")
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

struct ColumnHeightPreferenceKey: PreferenceKey {
    typealias Value = CGFloat
    
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
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
