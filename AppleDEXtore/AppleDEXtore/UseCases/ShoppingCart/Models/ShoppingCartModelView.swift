//
//  ShoppingCartModelView.swift
//  AppleDEXtore
//
//  Created by Jorge Marciel Pariente on 11/2/22.
//

import Foundation

class ShoppingCartModelView {
    var product: ProductModelView
    var cantidad: Int
    
    init(product: ProductModelView){
        self.product = product
        cantidad = 0
    }
}
