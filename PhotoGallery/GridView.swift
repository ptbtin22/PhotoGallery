//
//  GridView.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import SwiftUI
import Kingfisher

struct GridView: View {
    @StateObject private var viewModel = PhotosViewModel()
    let title: String
    
    private let columns = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(viewModel.photos) { photo in
                        KFImage(photo.thumbnailUrl)
                            .resizable()
                            .placeholder {
                                Rectangle()
                                    .fill(Color.gray.opacity(0.3))
                            }
                            .fade(duration: 0.25)
                            .aspectRatio(1, contentMode: .fill)
                            .clipped()
                            .cornerRadius(5)
                    }
                }
                .padding(.horizontal, 1)
            }
            .padding(.horizontal, 5)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadPhotos()
            }
        }
    }
}

#Preview {
    GridView(title: "Recents")
}
