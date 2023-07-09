//
//  ThreadModelModel.swift
//  ThreadModelsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation

struct ThreadModel: Identifiable {
    let id: Int
    let name: String
    let isVerified: Bool
    let time: String
    let message: String
    let profileImage: String
    let messagePhoto: String?
}

struct GenerateThreadData {
    static func generate() -> [ThreadModel] {
        return [
            ThreadModel(
                id: 1,
                name: "Hαɾσɳ 𓆂",
                isVerified: false,
                time: "2h",
                message: "Had a lil bit of time so i remade the new ThreadModels app in SwiftUI",
                profileImage: "ekstinct",
                messagePhoto: "threadlogo"
            ),
            ThreadModel(
                id: 2,
                name: "Elon Musk",
                isVerified: true,
                time: "3h",
                message: "Just tried the 'clone of a clone' app. Not impressed. Originality is key and innovation drives progress. Stick with the real deal, folks. #AuthenticityMatters #InnovationOverImitation",
                profileImage: "elon",
                messagePhoto: "thr"
            ),
            ThreadModel(
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
