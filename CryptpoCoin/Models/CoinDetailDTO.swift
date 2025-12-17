//
//  CoinDetailDTO.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation

struct CoinDetailDTO: Decodable {

    let id: String
    let symbol: String
    let name: String
    let image: String

    let currentPrice: Double
    let priceChangePercentage24h: Double

    let marketCap: Double
    let totalVolume: Double
    let high24h: Double
    let low24h: Double

    let ath: Double
    let athChangePercentage: Double
    let atl: Double
    let atlChangePercentage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCap = "market_cap"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case atl
        case atlChangePercentage = "atl_change_percentage"
    }
}
