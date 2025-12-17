
import Foundation

let coinDetailJSON: Data = """
[
  {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png",
    "current_price": 132263,
    "market_cap": 2639930949286,
    "market_cap_rank": 1,
    "total_volume": 73620738873,
    "high_24h": 132487,
    "low_24h": 128914,
    "price_change_24h": 2335.29,
    "price_change_percentage_24h": 1.79,
    "circulating_supply": 19963065,
    "total_supply": 19963065,
    "max_supply": 21000000,
    "ath": 190538,
    "atl": 72.61,
    "last_updated": "2025-12-16T23:10:23.147Z"
  }
]
""".data(using: .utf8)!
