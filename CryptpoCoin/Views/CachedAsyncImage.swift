
import SwiftUI

struct CachedAsyncImage: View {

    let url: URL?

    @State private var image: UIImage?
    @State private var isLoading = false

    var body: some View {
        Group {
            if let image {
                Image(uiImage: image)
                    .resizable()
            } else if isLoading {
                ProgressView()
            } else {
                Color.clear
            }
        }
        .onAppear {
            loadImage()
        }
    }

    private func loadImage() {
        guard
            let url,
            image == nil,
            !isLoading
        else { return }
        
        let nsURL = url as NSURL
        
        if let cached = ImageCache.shared.image(for: nsURL) {
            self.image = cached
            return
        }
        
        isLoading = true
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let uiImage = UIImage(data: data) {
                    ImageCache.shared.insert(uiImage, for: nsURL)
                    self.image = uiImage
                }
            } catch {
#if DEBUG
                print("Image load failed for URL:", url)
#endif
            }
            isLoading = false
        }
    }
}
