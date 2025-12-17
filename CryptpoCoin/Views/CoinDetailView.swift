
import SwiftUI

struct CoinDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: CoinDetailViewModel

    init(coinId: String) {
        _viewModel = StateObject(
            wrappedValue: CoinDetailViewModel(coinId: coinId)
        )
    }

    var body: some View {
        content
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationTitle(navigationTitle)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .foregroundColor(.accentColor)
                }
            }
    }

    private var navigationTitle: String {
        if case .success(let detail) = viewModel.state {
            return detail.name
        }
        return ""
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .success(let detail):
            CoinDetailContentView(detail: detail)
                .refreshable {
                    viewModel.fetchDetail()
                }

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


