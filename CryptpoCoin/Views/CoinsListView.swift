//
//  CoinsListViews.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//


import SwiftUI

import SwiftUI

struct CoinsListView: View {

    @StateObject private var viewModel = CoinsListViewModel()

    var body: some View {
        NavigationStack {
            content
                .navigationTitle("Crypto Coins")
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .loading:
            ProgressView("Loading coins...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .error(let message):
            VStack(spacing: 12) {
                Text(message)
                    .foregroundColor(.red)

                Button("Retry") {
                    viewModel.refresh()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success(let coins):
            List(coins) { coin in
                NavigationLink(value: coin) {
                    CoinRowView(coin: coin)
                }
            }
            .refreshable {
                viewModel.refresh()
            }
            .navigationDestination(for: Coin.self) { coin in
                CoinDetailView(coin: coin)
            }
        }
    }
}


#Preview {
    CoinsListView()
}
