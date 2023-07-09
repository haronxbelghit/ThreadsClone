//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ThreadViewModel()

    var body: some View {
        VStack(spacing: 0) {
            ThreadsContentView(viewModel: viewModel)
                .background(Color(UIColor.systemBackground))
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
        .onAppear {
            viewModel.fetchThreads()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
