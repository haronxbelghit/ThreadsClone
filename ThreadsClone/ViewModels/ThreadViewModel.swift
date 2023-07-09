//
//  ThreadViewModel.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation
import SwiftUI

class ThreadViewModel: ObservableObject {
    @Published var threadCards: [ThreadCardViewModel] = []

    func fetchThreads() {
        // Simulated data fetching or API call
        let threads = GenerateThreadData.generate()
        self.threadCards = threads.map { thread in
            ThreadCardViewModel(thread: thread)
        }
    }
}
