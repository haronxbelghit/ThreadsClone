//
//  ThreadCard.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import SwiftUI

struct ThreadCard: View {
    @StateObject private var viewModel: ThreadCardViewModel

    init(viewModel: ThreadCardViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(viewModel.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.trailing, 8)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(viewModel.name)
                        .font(.headline)
                    if viewModel.isVerified {
                        Image("quality")
                            .resizable()
                            .frame(width: 16, height: 16)
                    }
                    Spacer()
                    Text(viewModel.time)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Button(action: { viewModel.openMoreSheet() }) {
                        Image("more")
                            .padding(.leading, 8)
                    }
                }
                .padding(.bottom, 2)

                Text(viewModel.message)
                    .padding(.bottom, 4)

                if let messagePhoto = viewModel.messagePhoto {
                    Image(messagePhoto)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 200)
                        .cornerRadius(16)
                        .padding(.bottom, 4)
                }

                HStack(spacing: 16) {
                    LikeButton(isLiked: $viewModel.isLiked)
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
        .sheet(isPresented: $viewModel.showSheet) {
            MoreBottomSheet(showSheet: $viewModel.showSheet)
        }
        .id(viewModel.id) // Explicit id for the view
    }
}
