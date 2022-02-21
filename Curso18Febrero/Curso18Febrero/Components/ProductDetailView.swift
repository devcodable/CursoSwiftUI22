//
//  ProductDetailView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Binding var product: ProductModelView
    var addToCart: () -> ()
    var removeFromCart: () -> ()
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(height: 300)
            
            Text(product.name)
                .font(.largeTitle)
                .bold()
            
            Divider()
            
            Text(product.description)
                .multilineTextAlignment(.center)
            
            Spacer()
            HStack {
                Text("\(product.price)€")
                
                Spacer()
                
                if !product.isInCart {
                    
                    Button {
                        self.addToCart()
                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                            .foregroundColor(.white)
                    }
                } else {
                    
                    CartCapsuleView(count: $product.cantityInCart)
                    
                    Button {
                        self.removeFromCart()
                    } label: {
                        Image(systemName: "cart.badge.minus")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 35)
                            .foregroundColor(.red)
                    }
                }

            }
        }
        .padding(.horizontal, 20)
        .background(Color.mint.opacity(0.3))
    }
}
