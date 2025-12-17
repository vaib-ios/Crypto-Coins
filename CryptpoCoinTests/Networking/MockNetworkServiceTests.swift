//
//  MockNetworkServiceTests.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import XCTest
@testable import CryptpoCoin

final class MockNetworkServiceTests: XCTestCase {

    func test_fetch_returnsDecodedArray_onSuccess() async throws {
        // GIVEN
        let mockService = MockNetworkService(
            result: .success(testCoinsJSON)
        )

        // WHEN
        let coin: [TestCoin] = try await mockService.fetch(
            DummyEndpoint()
        )

        // THEN
        XCTAssertEqual(coin.count, 100)
        XCTAssertEqual(coin.first?.id, "bitcoin")
    }

    func test_fetch_throwsError_onFailure() async {
        // GIVEN
        let expectedError = URLError(.notConnectedToInternet)
        let mockService = MockNetworkService(
            result: .failure(expectedError)
        )

        // WHEN / THEN
        do {
            let _: TestCoin = try await mockService.fetch(
                DummyEndpoint()
            )
            XCTFail("Expected error to be thrown")
        } catch {
            XCTAssertTrue(error is URLError)
        }
    }
}
