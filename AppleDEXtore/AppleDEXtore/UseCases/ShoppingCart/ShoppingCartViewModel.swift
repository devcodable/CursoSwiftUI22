//
//  ShoppingCartViewModel.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import Foundation
import SwiftUI

class ShoppingCartViewModel: ObservableObject {
    
    @Published var cartItems: Binding<[ProductModelView]>

    init(cartItems: Binding<[ProductModelView]>) {
        self.cartItems = cartItems
    }
    
    func getTotal() -> Int {
        var total: Int = 0
        for item in cartItems {
            total += (item.price.wrappedValue * item.inCart.wrappedValue)
        }
        
        return total
    }

}
