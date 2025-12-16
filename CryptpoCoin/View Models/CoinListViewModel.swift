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
    
    @Published var coins: [Coin] = []

    init() {
       loadCoins()
    }

    private func loadCoins() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.state = .success(mockCoins)
        }
    }
    
    func retry() {
        loadCoins()
    }
}
