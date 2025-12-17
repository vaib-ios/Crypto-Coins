
import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case httpError(Int)
    case decodingError
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .invalidResponse:
            return "Invalid server response."
        case .httpError(let code):
            return "Server error (code \(code))."
        case .decodingError:
            return "Failed to decode response."
        case .unknown:
            return "Something went wrong. Please try again."
        }
    }
}
