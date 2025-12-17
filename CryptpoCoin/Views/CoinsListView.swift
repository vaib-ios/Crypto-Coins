
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
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(coins) { coin in
                        NavigationLink(value: coin.id) {
                            CoinRowView(coin: coin)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(.secondarySystemBackground))
                                        .shadow(
                                            color: Color.black.opacity(0.06),
                                            radius: 6,
                                            x: 0,
                                            y: 4
                                        )
                            ).contentShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .refreshable {
                viewModel.refresh()
            }
            .navigationDestination(for: String.self) { coinId in
                CoinDetailView(coinId: coinId)
            }
        }
    }
}


#Preview {
    CoinsListView()
}
