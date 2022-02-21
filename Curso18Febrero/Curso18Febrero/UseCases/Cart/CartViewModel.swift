//
//  CartViewModel.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import Foundation
import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var cartItems: Binding<[ProductModelView]>
    
    init(cartItems: Binding<[ProductModelView]>) {
        self.cartItems = cartItems
    }
    
    
    func getTotal() -> Int {
        var total = 0
        for item in cartItems {
            total += item.price.wrappedValue * item.cantityInCart.wrappedValue
        }
        return total
    }
}
