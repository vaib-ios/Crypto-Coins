

import XCTest
import Foundation
@testable import CryptpoCoin

enum Result {
    case success(Data)
    case failure(Error)
}

final class MockNetworkService: NetworkServiceProtocol {
   
       var result: Result

       init(result: Result) {
           self.result = result
       }

       func fetch<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
           switch result {
           case .success(let data):
               return try JSONDecoder().decode(T.self, from: data)
           case .failure(let error):
               throw error
           }
       }
}
