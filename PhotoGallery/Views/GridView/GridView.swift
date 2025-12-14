//
//  GridView.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import SwiftUI

struct GridView: View {
    @StateObject private var viewModel = PhotosViewModel()
    let title: String
    
    private let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 5)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 5) {
                ForEach(viewModel.photos) { photo in
                    NavigationLink(destination: DetailView(photo: photo)) {
                        PhotoCell(url: photo.thumbnailUrl)
                            .onAppear {
                                if photo == viewModel.photos.last {
                                    Task {
                                        await viewModel.loadMorePhotos()
                                    }
                                }
                            }
                    }
                }
            }
            .padding(.horizontal, 5)

            if viewModel.isLoading {
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            if viewModel.photos.isEmpty {
                await viewModel.loadMorePhotos()
            }
        }
    }
}

#Preview {
    GridView(title: "Recents")
}
