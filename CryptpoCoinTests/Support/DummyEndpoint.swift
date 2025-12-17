
import Foundation
@testable import CryptpoCoin

struct DummyEndpoint: Endpoint {
    var url: URL? {
        URL(string: "https://www.google.com")
    }
}
