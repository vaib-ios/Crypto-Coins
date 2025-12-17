
import Foundation

@MainActor
final class CoinDetailViewModel: ObservableObject {

    enum ViewState {
        case loading
        case success(CoinDetailDTO)
        case error(String)
    }

    @Published private(set) var state: ViewState = .loading

    private let networkService: NetworkServiceProtocol
    private let coinId: String

    init(
        coinId: String,
        networkService: NetworkServiceProtocol = NetworkService()
    ) {
        self.coinId = coinId
        self.networkService = networkService
        fetchDetail()
    }

    func fetchDetail() {
        state = .loading

        Task { @MainActor in
            do {
                let result: [CoinDetailDTO] =
                    try await networkService.fetch(
                        CoinGeckoEndpoint.coinDetail(id: coinId)
                    )

                guard let detail = result.first else {
                    state = .error("No detail data available.")
                    return
                }

                state = .success(detail)

            } catch {
                state = .error("Unable to load coin details. Please try again.")
            }
        }
    }
}
