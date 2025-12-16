//
//  CoinsListViews.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//


import SwiftUI

struct CoinsListView: View {

    let coins = mockCoins

    var body: some View {
        NavigationStack {
            List(coins) { coin in
                NavigationLink(value: coin) {
                    CoinRowView(coin: coin)
                }
            }
            .navigationTitle("Crypto Coins")
            .navigationDestination(for: Coin.self) { coin in
                CoinDetailView(coin: coin)
            }
        }
    }
}

#Preview {
    CoinsListView()
}
