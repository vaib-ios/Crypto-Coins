import XCTest
@testable import CryptpoCoin

@MainActor
final class CoinDetailViewModelTests: XCTestCase {

    func test_fetchDetail_setsSuccessState_whenAPI_succeeds() async {
        let mockService = MockNetworkService(
            result: .success(coinDetailJSON)
        )

        let viewModel = CoinDetailViewModel(
            coinId: "bitcoin",
            networkService: mockService
        )

        let expectation = XCTestExpectation(description: "State becomes success")

        Task {
            for _ in 0..<10 {
                if case .success(let detail) = viewModel.state {
                    XCTAssertEqual(detail.id, "bitcoin")
                    expectation.fulfill()
                    return
                }
                try await Task.sleep(nanoseconds: 100_000_000)
            }
        }

        await fulfillment(of: [expectation], timeout: 2)
    }

    func test_fetchDetail_setsErrorState_whenAPI_fails() async {
        let mockService = MockNetworkService(
            result: .failure(URLError(.notConnectedToInternet))
        )

        let viewModel = CoinDetailViewModel(
            coinId: "bitcoin",
            networkService: mockService
        )

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
}
