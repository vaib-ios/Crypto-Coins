//
//  CoinDetailView.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import SwiftUI

struct CoinDetailView: View {

    let coin: Coin

    var body: some View {
        VStack(spacing: 16) {
            Text(coin.name)
                .font(.largeTitle)
                .bold()

            Text(coin.symbol.uppercased())
                .foregroundStyle(.secondary)

            Text("$\(coin.price, specifier: "%.2f")")
                .font(.title)

            Spacer()
        }
        .padding()
        .navigationTitle(coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
