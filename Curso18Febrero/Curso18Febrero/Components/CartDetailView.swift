//
//  CartDetailView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import SwiftUI

struct CartDetailView: View {
    
    @Binding var product: ProductModelView
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 120)
                VStack {
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Divider()
                        .padding(.bottom)
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("\(product.price)€")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    
                    CartCapsuleView(count: $product.cantityInCart)
                        
                        
                }
                .padding(.leading)
            }
            .padding()
            
        }
        .frame(maxHeight: 150)
        .background {
            Color.gray.opacity(0.5).blur(radius: 20)
        }
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
    }
}
