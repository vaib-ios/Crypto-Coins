
import Foundation

struct Coin: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let change24h: Double
    let imageURL: URL?
}

extension Coin {

    init(dto: CoinDTO) {
        self.id = dto.id
        self.name = dto.name
        self.symbol = dto.symbol.uppercased()
        self.price = dto.currentPrice
        self.change24h = dto.priceChangePercentage24h ?? 0
        self.imageURL = URL(string: dto.image)
    }
}


