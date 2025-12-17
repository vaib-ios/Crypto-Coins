//
//  MockCoinDetail.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation

enum MockCoinDetail {

    static let bitcoin = CoinDetailDTO(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://coin-images.coingecko.com/coins/images/1/large/bitcoin.png",
        currentPrice: 132422,
        priceChangePercentage24h: 1.78,
        marketCap: 2_640_000_000_000,
        totalVolume: 72_800_000_000,
        high24h: 132487,
        low24h: 128914,
        ath: 190538,
        athChangePercentage: -30.54,
        atl: 72.61,
        atlChangePercentage: 182147.83
    )

    static func forCoin(id: String) -> CoinDetailDTO {
        return bitcoin
    }
}
