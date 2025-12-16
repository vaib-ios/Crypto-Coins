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

            Circle()
                .fill(Color.gray.opacity(0.3))
                .frame(width: 40, height: 40)

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
        .padding(.vertical, 8)
    }
}
