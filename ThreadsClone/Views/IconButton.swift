//
//  IconButton.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation
import SwiftUI

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
