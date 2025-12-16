//
//  Untitled.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation

@MainActor
final class CoinsListViewModel: ObservableObject {

    @Published var coins: [Coin] = []

    init() {
        loadCoins()
    }

    private func loadCoins() {
        coins = mockCoins
    }
}
