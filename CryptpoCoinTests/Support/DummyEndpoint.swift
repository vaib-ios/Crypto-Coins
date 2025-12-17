//
//  Untitled.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import Foundation
@testable import CryptpoCoin

struct DummyEndpoint: Endpoint {
    var url: URL? {
        URL(string: "https://www.google.com")
    }
}
