//
//  CatalogViewModel.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import Foundation
//import SwiftUI

class CatalogViewModel: ObservableObject {
    
    @Published var catalog: CatalogModelView = CatalogModelView(modelServer: nil)
    @Published var cartItems: [ProductModelView] = []
    
    init() {
        getData()
    }
    
    func getData() {
        if let url = Bundle.main.url(forResource: "catalog", withExtension: "json"),
           let jsonData = try? Data(contentsOf: url) {

            if let modelServer = try? JSONDecoder().decode(CatalogModelServer.self, from: jsonData) {
                print(modelServer)
                self.catalog = CatalogModelView(modelServer: modelServer)
            } else {
                print("Fallo al leer JSON")
            }
        }
    }
    
    func getCartCount() -> Int {
        
        var total = 0
        
        for item in cartItems {
            total += item.cantityInCart
        }
        
        return total
    }
    
}
