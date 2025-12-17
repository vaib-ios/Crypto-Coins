
import Foundation
@testable import CryptpoCoin

struct DummyEndpoint: Endpoint {
    var url: URL? {
        URL(string: "https://api.coingecko.com/api/v3/coins/markets?x-cg-demo-api-key=CG-xxcGCMWaV68vFQxAeLALTMQN&vs_currency=usd&category=layer-1&price_change_percentage=1h")
    }
}
