//
//  NetworkService.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//
import Foundation

final class NetworkService: NetworkServiceProtocol {

    func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        try await fetchWithRetry(endpoint, retries: 1)
    }

    private func fetchWithRetry<T: Decodable>(
        _ endpoint: Endpoint,
        retries: Int
    ) async throws -> T {

        guard let url = endpoint.url else {
            throw NetworkError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.httpError(httpResponse.statusCode)
            }

            return try JSONDecoder().decode(T.self, from: data)

        } catch {
            if retries > 0 {
                return try await fetchWithRetry(endpoint, retries: retries - 1)
            } else {
                throw error
            }
        }
    }
}
