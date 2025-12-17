
import XCTest
@testable import CryptpoCoin

@MainActor
final class CoinsListViewModelTests: XCTestCase {

    @MainActor
    func test_refresh_setsSuccessState_whenAPI_succeeds() async {
        let mockService = MockNetworkService(
            result: .success(coinsListJSON)
        )

        let viewModel = CoinsListViewModel(networkService: mockService)

        let expectation = XCTestExpectation(description: "State becomes success")

        Task {
            for _ in 0..<10 {
                if case .success(let coins) = viewModel.state {
                    XCTAssertEqual(coins.count, 2)
                    XCTAssertEqual(coins.first?.id, "bitcoin")

                    await MainActor.run {
                        expectation.fulfill()
                    }
                    return
                }
                try await Task.sleep(nanoseconds: 100_000_000)
            }
        }

        await fulfillment(of: [expectation], timeout: 2)
    }

    
    @MainActor
    func test_refresh_usesFallback_whenAPIfails() async {
        let mockService = MockNetworkService(
            result: .failure(URLError(.notConnectedToInternet))
        )

        let viewModel = CoinsListViewModel(networkService: mockService)

        let expectation = XCTestExpectation(description: "Fallback success state")

        for _ in 0..<10 {
            if case .success(let coins) = viewModel.state {
                XCTAssertFalse(coins.isEmpty)
                expectation.fulfill()
                break
            }
            try? await Task.sleep(nanoseconds: 100_000_000) // 0.1s
        }

        await fulfillment(of: [expectation], timeout: 2)
    }


}
