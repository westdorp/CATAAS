//
//  Cat.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import Foundation

struct Cat: Codable, Identifiable {
    var id: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
    }
}
