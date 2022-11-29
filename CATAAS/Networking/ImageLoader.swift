//
//  ImageLoader.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import Foundation

final class ImageLoader: ObservableObject {

    enum State {
        case idle
        case inProgress
        case complete
    }


    // MARK: - Properties

    @Published private(set) var imageData: Data
    @Published private(set) var state: State = .idle

    // MARK: - Initializers

    init(urlString imageURLString: String) {
        self.imageData = Data()

        let cache = URLCache.shared
        guard let url = URL(string: imageURLString) else { return }
        let request = URLRequest(url: url,
                                 cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad,
                                 timeoutInterval: .timeout)

        state = .inProgress
        
        if let data = cache.cachedResponse(for: request)?.data {
            self.imageData = data
            state = .complete
        } else {
            // Ignoring errors because failing to load is inconsequential
            URLSession.shared.dataTask(with: url) { (data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.imageData = data
                        self.state = .complete
                    }

                }
            }.resume()
        }
    }
}

// MARK: - Private Extensions

private extension Double {
    static let timeout = 60.0
}
