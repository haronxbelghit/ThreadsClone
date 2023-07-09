//
//  ThreadCardViewModel.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import SwiftUI

class ThreadCardViewModel: ObservableObject, Identifiable {
    let id: UUID = UUID()
    @Published var showSheet = false
    @Published var isLiked = false

    let name: String
    let isVerified: Bool
    let time: String
    let message: String
    let profileImage: String
    let messagePhoto: String?

    init(thread: ThreadModel) {
        self.name = thread.name
        self.isVerified = thread.isVerified
        self.time = thread.time
        self.message = thread.message
        self.profileImage = thread.profileImage
        self.messagePhoto = thread.messagePhoto
    }

    func toggleLike() {
        isLiked.toggle()
    }

    func openMoreSheet() {
        showSheet = true
    }

    func closeMoreSheet() {
        showSheet = false
    }
}
