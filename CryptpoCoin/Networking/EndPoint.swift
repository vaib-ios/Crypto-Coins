//
//  EndPoint.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//
import Foundation

protocol Endpoint {
    var url: URL? { get }
}

enum CoinGeckoEndpoint: Endpoint {

    case coinsList

    var url: URL? {
        switch self {
        case .coinsList:
            let urlString =
            "https://api.coingecko.com/api/v3/coins/markets" +
            "?vs_currency=usd" +
            "&category=layer-1" +
            "&price_change_percentage=1h" +
            "&x-cg-demo-api-key=CG-xxcGCMWaV68vFQxAeLALTMQN"

            return URL(string: urlString)
        }
    }
}
