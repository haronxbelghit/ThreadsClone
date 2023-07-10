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
            VStack {
                Image(viewModel.profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(.trailing, 8)

//                HStack(spacing: 0) {
//                    Image("ekstinct")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 20, height: 20)
//                        .clipShape(Circle())
//
//                    Image("ekstinct")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 25, height: 25)
//                        .clipShape(Circle())
//
//                    Image("ekstinct")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 15, height: 15)
//                        .clipShape(Circle())
//                }
//                .padding(.top, 4)
//                .padding(.leading, -50)
            }

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

                Spacer()

                HStack(spacing: 0) {
                    Image("ekstinct")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                        .offset(x: 5, y: -2.5) // Adjust the X and Y coordinates for the first image

                    Image("ekstinct")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .clipShape(Circle())
                        .offset(x: 5, y: -15) // Adjust the X and Y coordinates for the second image

                    Image("ekstinct")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 15, height: 15)
                        .clipShape(Circle())
                        .offset(x: -20, y: 5) // Adjust the X and Y coordinates for the third image
                }
                .padding(.leading, -60)
                .padding(.top, -45)
            }
            .padding(.trailing, 8)
        }
        .padding(.vertical, 8)
        .overlay(
            Rectangle()
                .frame(width: 1)
                .foregroundColor(.gray.opacity(0.5))
                .frame(maxHeight: .infinity)
                .padding(.leading, -160)
                .padding(.top, 50)
                .padding(.bottom, 55)
        )
        .sheet(isPresented: $viewModel.showSheet) {
            MoreBottomSheet(showSheet: $viewModel.showSheet)
        }
        .id(viewModel.id)
    }
}

struct ThreadCard_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ThreadCardViewModel(thread: ThreadModel(id: 1, name: "John Doe", isVerified: false, time: "1h", message: "This is a sample message", profileImage: "ekstinct", messagePhoto: "threadlogo"))
        ThreadCard(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
            .padding(.top, 160)
            .padding(.leading, 25)
    }
}

