//
//  APIService.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import Foundation

protocol APIService {
    func fetchCats() async throws -> [Cat]
}
