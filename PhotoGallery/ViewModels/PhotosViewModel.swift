//
//  PhotosViewModel.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import Foundation
import Combine

@MainActor
class PhotosViewModel: PhotosViewModelProtocol {
    @Published var photos: [Photo] = []
    @Published var isLoading = false
    @Published var canLoadMore = false
    @Published var error: Error?

    private var currentPage = 1
    private let pageSize = 30
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadInitialPhotosIfNeeded() async {
        guard photos.isEmpty else { return }
        await loadMorePhotos()
    }
    
    func loadMorePhotos() async {
        guard !isLoading else { return }
        
        isLoading = true
        error = nil
        
        do {
            let newPhotos = try await networkService.fetchPhotos(page: currentPage)
            // Update state only on success
            canLoadMore = newPhotos.count == pageSize
            photos.append(contentsOf: newPhotos)
            currentPage += 1
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
}
