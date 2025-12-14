//
//  DetailView.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import SwiftUI
import Kingfisher

struct DetailView: View {

    // MARK: - Properties

    let photo: Photo

    // MARK: - States

    @State private var loadFailed = false
    @State private var errorMessage: String?

    // MARK: - Body

    var body: some View {
        Group {
            if loadFailed {
                ErrorView(errorMessage: errorMessage ?? "") {
                    loadFailed = false
                }
            } else {
                KFImage(photo.imageUrl)
                    .resizable()
                    .placeholder { ProgressView() }
                    .onFailure { error in
                        loadFailed = true
                        errorMessage = error.localizedDescription
                    }
                    .aspectRatio(contentMode: .fit)
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailView(
        photo: Photo(
            id: "1",
            author: "Martin Luther King",
            imageUrl: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Martin_Luther_King%2C_Jr..jpg/640px-Martin_Luther_King%2C_Jr.22.zxc")!,
            thumbnailUrl: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Martin_Luther_King%2C_Jr..jpg/200px-Martin_Luther_King%2C_Jr..jpg")!
        )
    )
}
