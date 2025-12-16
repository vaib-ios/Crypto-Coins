//
//  Untitled.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation

@MainActor
final class CoinsListViewModel: ObservableObject {

    enum ViewState {
        case loading
        case success([Coin])
        case error(String)
    }

    @Published private(set) var state: ViewState = .loading

    private let networkService: NetworkServiceProtocol

    // MARK: - Init

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
        refresh()
    }

    // MARK: - Public Intent

    func refresh() {
        state = .loading

        Task {
            do {
                let dtos: [CoinDTO] =
                try await networkService.fetch(CoinGeckoEndpoint.coinsList)

                let coins = dtos.map(Coin.init)
                state = .success(coins)

            } catch {
                state = .error(error.localizedDescription)
            }
        }
    }
}
