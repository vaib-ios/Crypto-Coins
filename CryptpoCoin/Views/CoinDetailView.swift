//
//  CoinDetailView.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import SwiftUI

struct CoinDetailView: View {

    @StateObject private var viewModel: CoinDetailViewModel

    init(coinId: String) {
        _viewModel = StateObject(
            wrappedValue: CoinDetailViewModel(coinId: coinId)
        )
    }

    var body: some View {
        content
            .navigationTitle("Coin Detail")
            .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success(let detail):
            CoinDetailContentView(detail: detail)

        case .error(let message):
            VStack(spacing: 16) {
                Text(message)
                    .foregroundColor(.secondary)

                Button("Retry") {
                    viewModel.fetchDetail()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

