//
//  CoinDetailViewModel.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation

@MainActor
final class CoinDetailViewModel: ObservableObject {

    enum ViewState {
        case loading
        case success(CoinDetailDTO)
        case error(String)
    }

    @Published private(set) var state: ViewState = .loading

    private let networkService: NetworkServiceProtocol
    private let coinId: String

    init(
        coinId: String,
        networkService: NetworkServiceProtocol = NetworkService()
    ) {
        self.coinId = coinId
        self.networkService = networkService
        fetchDetail()
    }

    func fetchDetail() {
        state = .loading

        Task { @MainActor in
            do {
                let result: [CoinDetailDTO] =
                try await networkService.fetch(
                    CoinGeckoEndpoint.coinDetail(id: coinId)
                )

                if let detail = result.first {
                    state = .success(detail)
                } else {
                    state = .success(MockCoinDetail.forCoin(id: coinId))
                }

            } catch {
                let mockDetail = MockCoinDetail.forCoin(id: coinId)
                state = .success(mockDetail)
            }
        }
    }
}
