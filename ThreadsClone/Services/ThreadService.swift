//
//  ThreadService.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation

class ThreadService {
    func fetchThreads(completion: @escaping ([ThreadModel]) -> Void) {
        // Simulated asynchronous data fetching or API call
        DispatchQueue.global().async {
            let threads = GenerateThreadData.generate()
            DispatchQueue.main.async {
                completion(threads)
            }
        }
    }
}
