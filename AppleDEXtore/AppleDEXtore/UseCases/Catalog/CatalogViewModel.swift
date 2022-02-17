//
//  CatalogViewModel.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import Foundation
import SwiftUI

class CatalogViewModel: ObservableObject {
    
    @Published var catalog: CatalogModelView = CatalogModelView(modelServer: nil)
    @Published var selectedCategory: ProductCategory = .iphone
    @Published var cartList: [ProductModelView] = []
    
    @Published var navigateToShoppingCart = false
    
    init() {
        getData()
    }
    
    // MARK: GetData from JSON
    func getData() {
        if let url = Bundle.main.url(forResource: "catalog", withExtension: "json"),
           let jsonData = try? Data(contentsOf: url) {

            if let modelServer = try? JSONDecoder().decode(CatalogModelServer.self, from: jsonData) {
                
                self.catalog = CatalogModelView(modelServer: modelServer)
            } else {
                print("Fallo al leer JSON")
            }
        }
    }
    
    func getCartCount() -> Int {
        var count = 0
        for product in cartList {
            count += product.inCart
        }
        
        return count
    }
    
    func navigateToCart() {
        self.navigateToShoppingCart = true
    }
}
