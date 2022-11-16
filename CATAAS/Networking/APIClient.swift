//
//  APIClient.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import Foundation

final class APIClient: APIService {
    func fetchCats() async throws -> [Cat] {
        guard let components = URLComponents(string: "https://cataas.com/api/cats?skip=0&limit=25") else {
            fatalError("Malformed URL for CATAAS Endpoint")
        }

        guard let url = components.url else {
            fatalError("Malformed URL for CATAAS Endpoint")
        }

        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error while fetching data")
        }

        return try JSONDecoder().decode([Cat].self, from: data)
    }

}
