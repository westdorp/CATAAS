//
//  CatViewModel.swift
//  CATAAS
//
//  Created by  ¯\_(ツ)_/¯ on 11/15/22.
//

import Foundation

struct CatViewModel: Identifiable {

    private let cat: Cat

    var id: String {
        cat.id
    }

    var imageURLString: String {
        "https://cataas.com/cat/\(id)"
    }

    init(cat: Cat) {
        self.cat = cat
    }
}
