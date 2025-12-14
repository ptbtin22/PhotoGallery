//
//  ErrorView.swift
//  PhotoGallery
//
//  Created by Tin Pham on 14/12/25.
//

import SwiftUI

struct ErrorView: View {
    let errorMessage: String
    var onRetry: (() -> Void)?

    var body: some View {
        VStack(spacing: 24) {
            // Icon with decorative circles
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.1))
                    .frame(width: 100, height: 100)

                Circle()
                    .stroke(Color.red.opacity(0.3), lineWidth: 2)
                    .frame(width: 100, height: 100)

                Image(systemName: "photo.badge.exclamationmark")
                    .font(.system(size: 40))
                    .foregroundStyle(.red.opacity(0.8))
            }

            VStack(spacing: 8) {
                Text("Oops!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.primary)

                Text("Failed to load image")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal, 32)
            }

            // Optional retry button
            if let onRetry {
                Button(action: onRetry) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.clockwise")
                        Text("Try Again")
                    }
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 12)
                    .background(
                        Capsule()
                            .fill(Color.red.opacity(0.85))
                    )
                }
            }
        }
    }
}

#Preview("With Retry") {
    ErrorView(errorMessage: "Network connection lost") {
        print("Retry tapped")
    }
    .frame(height: 300)
}
