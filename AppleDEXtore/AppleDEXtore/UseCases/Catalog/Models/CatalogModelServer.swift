//
//  CatalogModelServer.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 10/2/22.
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
