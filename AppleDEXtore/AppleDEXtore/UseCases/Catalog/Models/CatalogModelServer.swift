//
//  CatalogModelServer.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
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
