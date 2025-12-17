
import Foundation

let coinsListJSON = """
[
  {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://example.com/bitcoin.png",
    "current_price": 50000,
    "price_change_percentage_24h": 2.5
  },
  {
    "id": "ethereum",
    "symbol": "eth",
    "name": "Ethereum",
    "image": "https://example.com/ethereum.png",
    "current_price": 3000,
    "price_change_percentage_24h": -1.2
  }
]
""".data(using: .utf8)!
