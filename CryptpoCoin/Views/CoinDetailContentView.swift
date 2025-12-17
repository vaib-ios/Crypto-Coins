//
//  CoinDetailContentView.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import SwiftUI

struct CoinDetailContentView: View {

    let detail: CoinDetailDTO

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                header
                priceCard
                marketStats
                allTimeStats
            }
            .padding()
        }
    }
    
    private var header: some View {
        HStack(spacing: 16) {
            CachedAsyncImage(url: URL(string: detail.image))
                .scaledToFit()
                .frame(width: 64, height: 64)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(detail.name)
                    .font(.title)
                    .bold()
                Text(detail.symbol.uppercased())
                    .foregroundColor(.secondary)
            }
        }
    }

    private var priceCard: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("Current Price")
                .font(.headline)

            Text("$\(detail.currentPrice, specifier: "%.2f")")
                .font(.largeTitle)
                .bold()

            HStack {
                Image(systemName: detail.priceChangePercentage24h >= 0 ? "arrow.up" : "arrow.down")
                Text("\(detail.priceChangePercentage24h, specifier: "%.2f")% (24h)")
            }
            .foregroundColor(detail.priceChangePercentage24h >= 0 ? .green : .red)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(detail.priceChangePercentage24h >= 0
                    ? Color.green.opacity(0.15)
                    : Color.red.opacity(0.15))
        )
    }

    private var marketStats: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Market Stats")
                .font(.title3)
                .bold()

            statRow("Market Cap", abbreviated(detail.marketCap))
            statRow("Volume", abbreviated(detail.totalVolume))
            statRow("High 24h", String(format: "$%.2f", detail.high24h))
            statRow("Low 24h", String(format: "$%.2f", detail.low24h))
        }
    }


    private var allTimeStats: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("All Time Stats")
                .font(.title3)
                .bold()

            statRow("ATH", String(format: "$%.2f", detail.ath))
            statRow("ATL", String(format: "$%.2f", detail.atl))
        }
    }

    private func statRow(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title).foregroundColor(.secondary)
            Spacer()
            Text(value).bold()
        }
    }

    private func format(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    private func abbreviated(_ value: Double) -> String {
        let absValue = abs(value)

        switch absValue {
        case 1_000_000_000_000...:
            return String(format: "%.2fT", value / 1_000_000_000_000)
        case 1_000_000_000...:
            return String(format: "%.2fB", value / 1_000_000_000)
        case 1_000_000...:
            return String(format: "%.2fM", value / 1_000_000)
        default:
            return String(format: "%.0f", value)
        }
    }

}


