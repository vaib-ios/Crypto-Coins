//
//  CoinsDetailViewModelTests.swift
//  CryptpoCoinTests
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import XCTest
@testable import CryptpoCoin

@MainActor
final class CoinDetailViewModelTests: XCTestCase {

    func test_fetchDetail_usesFallback_whenAPIFails() async {
        // GIVEN
        let mockService = MockNetworkService(
            result: .failure(URLError(.notConnectedToInternet))
        )

        let viewModel = CoinDetailViewModel(
            coinId: "bitcoin",
            networkService: mockService
        )

        let expectation = XCTestExpectation(description: "Fallback detail loaded")

        // WHEN / THEN
        for _ in 0..<10 {
            if case .success(let detail) = viewModel.state {
                XCTAssertEqual(detail.id, "bitcoin")
                expectation.fulfill()
                break
            }
            try? await Task.sleep(nanoseconds: 100_000_000)
        }

        await fulfillment(of: [expectation], timeout: 2)
    }
}
