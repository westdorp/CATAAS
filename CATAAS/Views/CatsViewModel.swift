//
//  CatsViewModel.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import Foundation

@MainActor
final class CatsViewModel: ObservableObject {

    private let apiService: APIService

    @Published
    private(set) var catViewModels: [CatViewModel] = []

    init(apiService: APIService) {
        self.apiService = apiService
    }

    func start() {
        Task {
            do {
                catViewModels = try await apiService.fetchCats()
                    .map(CatViewModel.init)
            } catch {
                print("Unable to fetch cats \(error)")
            }
        }
    }
}
