//
//  PhotosViewModelProtocol.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import Combine

protocol PhotosViewModelProtocol: ObservableObject {
    var photos: [Photo] { get }
    var isLoading: Bool { get }
    var error: Error? { get }

    func loadMorePhotos() async
}
