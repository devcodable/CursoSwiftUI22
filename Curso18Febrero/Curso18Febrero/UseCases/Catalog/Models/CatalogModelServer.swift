//
//  CatalogModelServer.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import Foundation

struct CatalogModelServer: Codable {
    let products: [ProductModelServer]?
}

struct ProductModelServer: Codable {
    let name: String?
    let price: Int?
    let description: String?
    let category: String?
    let image: String?
}
