//
//  CatView.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import SwiftUI

struct CatView: View {

    @ObservedObject var loader: ImageLoader
    private let width = UIScreen.main.bounds.size.width
    let viewModel: CatViewModel

    var body: some View {
        Color(UIColor.secondarySystemBackground)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                switch loader.state {
                case .inProgress, .idle:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                case .complete:
                    if let image = UIImage(data: loader.imageData) {
                        if loader.imageData.isEmpty {
                            Image(systemName: "rectangle.slash")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } else {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                }
            }
    }

    init(viewModel: CatViewModel) {
        self.viewModel = viewModel
        loader = ImageLoader(urlString: viewModel.imageURLString)
    }
}
