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
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private var currentPage = 1
    private var canLoadMore = true
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    func loadPhotos() async {
        guard !isLoading && canLoadMore else { return }
        
        isLoading = true
        error = nil
        
        do {
            let newPhotos = try await networkService.fetchPhotos(page: currentPage)
            
            if newPhotos.isEmpty {
                canLoadMore = false
            } else {
                photos.append(contentsOf: newPhotos)
                currentPage += 1
            }
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
}
