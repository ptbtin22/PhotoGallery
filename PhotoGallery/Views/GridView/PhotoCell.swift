//
//  PhotoCell.swift
//  PhotoGallery
//
//  Created by Tin Pham on 14/12/25.
//

import SwiftUI
import Kingfisher

struct PhotoCell: View {
    let url: URL?

    var body: some View {
        KFImage(url)
            .resizable()
            .placeholder {
                Rectangle()
                    .fill(Color.secondary.opacity(0.3))
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    )
            }
            .fade(duration: 0.25)
            .aspectRatio(1, contentMode: .fill)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
