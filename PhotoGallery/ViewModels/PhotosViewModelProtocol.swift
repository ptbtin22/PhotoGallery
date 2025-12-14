//
//  PhotosViewModelProtocol.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import Foundation

@MainActor
protocol PhotosViewModelProtocol: ObservableObject {
    var photos: [Photo] { get }
    var isLoading: Bool { get }
    var canLoadMore: Bool { get }
    var error: Error? { get }
    
    func loadInitialPhotosIfNeeded() async
    func loadMorePhotos() async
}
