//
//  Coin.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation

struct Coin: Identifiable, Hashable {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let change24h: Double
}


