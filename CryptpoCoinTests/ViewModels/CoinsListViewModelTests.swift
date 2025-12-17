
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

        let expectation = XCTestExpectation(description: "State becomes error")

        Task {
            for _ in 0..<10 {
                if case .error(let message) = viewModel.state {
                    XCTAssertFalse(message.isEmpty)
                    expectation.fulfill()
                    return
                }
                try await Task.sleep(nanoseconds: 100_000_000)
            }
        }

        await fulfillment(of: [expectation], timeout: 2)
    }

    @MainActor
    func test_refresh_setsLoadingState_initially() {
        let mockService = MockNetworkService(
            result: .success(coinsListJSON)
        )

        let viewModel = CoinsListViewModel(networkService: mockService)

        if case .loading = viewModel.state {
            XCTAssertTrue(true)
        } else {
            XCTFail("Expected loading state initially")
        }
    }

}
