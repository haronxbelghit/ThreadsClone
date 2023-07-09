//
//  LikeButton.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation
import SwiftUI

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
