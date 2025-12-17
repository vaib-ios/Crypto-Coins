//
//  CoinRowView.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//


import SwiftUI

struct CoinRowView: View {

    let coin: Coin

    var body: some View {
        HStack(spacing: 12) {
            CachedAsyncImage(url: coin.imageURL)
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.headline)

                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(coin.price, specifier: "%.2f")")
                    .font(.headline)

                HStack(spacing: 4) {
                    Image(systemName: coin.change24h >= 0 ? "arrow.up" : "arrow.down")
                    Text("\(coin.change24h, specifier: "%.2f")%")
                }
                .font(.caption)
                .foregroundColor(coin.change24h >= 0 ? .green : .red)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(coin.name), \(coin.symbol)")
        .accessibilityValue(
            "Price \(coin.price), \(coin.change24h)% in last 24 hours"
        )
        .padding(.vertical, 8)
    }
}
