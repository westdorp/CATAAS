//
//  CatsView.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import SwiftUI

struct CatsView: View {
    @ObservedObject
    var viewModel: CatsViewModel

    var body: some View {
        NavigationView {
            List(viewModel.catViewModels) { viewModel in
                CatView(viewModel: viewModel)
            }
            .navigationTitle("Cats")
        }
        .onAppear {
            viewModel.start()
        }
    }
}
