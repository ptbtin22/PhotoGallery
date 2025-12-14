//
//  NetworkServiceProtocol.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchPhotos(page: Int) async throws -> [Photo]
}
