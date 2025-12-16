//
//  ImageCache.swift
//  CryptpoCoin
//
//  Created by Vaibhav Limbani on 17/12/25.
//

import SwiftUI

final class ImageCache {
    static let shared = ImageCache()

    private let cache = NSCache<NSURL, UIImage>()

    private init() {}

    func image(for url: NSURL) -> UIImage? {
        cache.object(forKey: url)
    }

    func insert(_ image: UIImage, for url: NSURL) {
        cache.setObject(image, forKey: url)
    }
}
