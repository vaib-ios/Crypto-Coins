
import SwiftUI

struct CoinRowView: View {

    let coin: Coin

    var body: some View {
        HStack(spacing: 12) {
            CachedAsyncImage(url: coin.imageURL)
                .scaledToFit()
                .frame(width: 40, height: 40)
                .background(Circle().fill(Color.white))
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.system(size: 16, weight: .medium))

                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("$\(coin.price, specifier: "%.2f")")
                    .font(.system(size: 18, weight: .semibold))

                HStack(spacing: 4) {
                    Image(systemName: coin.change24h >= 0 ? "arrow.up" : "arrow.down")
                    Text("\(coin.change24h, specifier: "%.2f")%")
                }
                .font(.caption.weight(.medium))
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(
                    Capsule()
                        .fill(
                            coin.change24h >= 0
                            ? Color.green.opacity(0.15)
                            : Color.red.opacity(0.15)
                        )
                )
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
