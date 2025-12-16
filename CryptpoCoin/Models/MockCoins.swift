//
//  MockCoins.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//



import Foundation

let mockCoins: [Coin] = [
    Coin(id: "bitcoin", name: "Bitcoin", symbol: "BTC", price: 43250.12, change24h: 2.34),
    Coin(id: "ethereum", name: "Ethereum", symbol: "ETH", price: 3180.45, change24h: -1.12),
    Coin(id: "solana", name: "Solana", symbol: "SOL", price: 98.32, change24h: 4.21),
    Coin(id: "cardano", name: "Cardano", symbol: "ADA", price: 0.52, change24h: 1.87),
    Coin(id: "ripple", name: "XRP", symbol: "XRP", price: 0.61, change24h: -0.45),
    Coin(id: "polkadot", name: "Polkadot", symbol: "DOT", price: 7.82, change24h: 3.04),
    Coin(id: "avalanche", name: "Avalanche", symbol: "AVAX", price: 36.19, change24h: -2.11),
    Coin(id: "chainlink", name: "Chainlink", symbol: "LINK", price: 14.72, change24h: 0.92),
    Coin(id: "polygon", name: "Polygon", symbol: "MATIC", price: 0.89, change24h: -1.33),
    Coin(id: "litecoin", name: "Litecoin", symbol: "LTC", price: 72.45, change24h: 1.56),

    Coin(id: "tron", name: "TRON", symbol: "TRX", price: 0.11, change24h: 0.67),
    Coin(id: "stellar", name: "Stellar", symbol: "XLM", price: 0.13, change24h: -0.29),
    Coin(id: "cosmos", name: "Cosmos", symbol: "ATOM", price: 10.41, change24h: 2.18),
    Coin(id: "near", name: "NEAR Protocol", symbol: "NEAR", price: 3.27, change24h: 5.34),
    Coin(id: "algorand", name: "Algorand", symbol: "ALGO", price: 0.19, change24h: -0.98),
    Coin(id: "vechain", name: "VeChain", symbol: "VET", price: 0.027, change24h: 1.11),
    Coin(id: "filecoin", name: "Filecoin", symbol: "FIL", price: 5.43, change24h: -3.21),
    Coin(id: "hedera", name: "Hedera", symbol: "HBAR", price: 0.067, change24h: 0.44),
    Coin(id: "theta", name: "Theta", symbol: "THETA", price: 1.34, change24h: 2.09),
    Coin(id: "tezos", name: "Tezos", symbol: "XTZ", price: 0.93, change24h: -1.74),

    Coin(id: "aave", name: "Aave", symbol: "AAVE", price: 96.12, change24h: 3.88),
    Coin(id: "uniswap", name: "Uniswap", symbol: "UNI", price: 6.45, change24h: -0.64),
    Coin(id: "maker", name: "Maker", symbol: "MKR", price: 1420.55, change24h: 2.91),
    Coin(id: "sandbox", name: "The Sandbox", symbol: "SAND", price: 0.48, change24h: -2.45),
    Coin(id: "decentraland", name: "Decentraland", symbol: "MANA", price: 0.53, change24h: 1.27),
    Coin(id: "axie", name: "Axie Infinity", symbol: "AXS", price: 6.82, change24h: -4.01),
    Coin(id: "eos", name: "EOS", symbol: "EOS", price: 0.71, change24h: 0.58),
    Coin(id: "flow", name: "Flow", symbol: "FLOW", price: 0.79, change24h: 2.63),
    Coin(id: "iota", name: "IOTA", symbol: "MIOTA", price: 0.22, change24h: -1.09),
    Coin(id: "zilliqa", name: "Zilliqa", symbol: "ZIL", price: 0.019, change24h: 0.91)
]
