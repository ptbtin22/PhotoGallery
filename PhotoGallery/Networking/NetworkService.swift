//
//  NetworkService.swift
//  PhotoGallery
//
//  Created by Tin Pham on 13/12/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case serverError(statusCode: Int)
    case decodingError
}

final class NetworkService: Sendable {
    private let session: URLSession
    
    nonisolated init(session: URLSession = .shared) {
        self.session = session
    }
    
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

// MARK: - NetworkServiceProtocol

extension NetworkService: NetworkServiceProtocol {
    func fetchPhotos(page: Int) async throws -> [Photo] {
        guard let url = APIEndpoint.photos(page: page).url else {
            throw NetworkError.badURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            let code = (response as? HTTPURLResponse)?.statusCode ?? -1
            throw NetworkError.serverError(statusCode: code)
        }
        
        do {
            let dtos = try decoder.decode([PhotoDTO].self, from: data)
            return dtos.map { $0.toDomain() }
        } catch {
            throw NetworkError.decodingError
        }
    }
}
