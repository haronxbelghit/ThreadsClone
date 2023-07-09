//
//  MoreBottomSheet.swift
//  ThreadsClone
//
//  Created by Belghit Haron on 9/7/2023.
//

import Foundation
import SwiftUI

struct MoreBottomSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var showSheet: Bool

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            MoreBottomSheetContent(showSheet: $showSheet) // Pass the showSheet binding to the MoreBottomSheetContent
                .background(Color(UIColor.systemBackground))
                .cornerRadius(20)
        }
        .presentationDetents([.height(270)])
        .presentationDragIndicator(.visible)
        .frame(alignment: .bottom)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MoreBottomSheetContent: View {
    @Binding var showSheet: Bool // Add the showSheet binding

    var body: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.gray.opacity(0.1))
                .overlay(
                    VStack(spacing: 0) {
                        Button(action: { showSheet = false }) { // Use the showSheet binding to dismiss the sheet
                            Text("Unfollow")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, minHeight: 16)
                                .padding()
                                .background(Color.clear)
                                .contentShape(Rectangle())
                        }

                        Divider().padding(0)

                        Button(action: { showSheet = false }) { // Use the showSheet binding to dismiss the sheet
                            Text("Mute")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, minHeight: 16)
                                .padding()
                                .background(Color.clear)
                                .contentShape(Rectangle())
                        }
                    }
                )
                .padding(.horizontal, 22)

            Divider().padding(16)

            VStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.1))
                    .overlay(
                        VStack(spacing: 0) {
                            Button(action: { showSheet = false }) {
                                Text("Hide")
                                    .fontWeight(.semibold)
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 16)
                                    .background(Color.clear)
                                    .contentShape(Rectangle())
                            }

                            Divider()

                            Button(action: {}) {
                                Text("Report")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                                    .padding()
                                    .frame(maxWidth: .infinity, minHeight: 16)
                                    .background(Color.clear)
                                    .contentShape(Rectangle())
                            }
                        }
                    )
                    .padding(.horizontal, 22)
            }
            Spacer(minLength: 16)
        }
    }
}
