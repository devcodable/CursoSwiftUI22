//
//  ProductView.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 10/2/22.
//

import SwiftUI

struct ProductView: View {
    
    @Binding var product: ProductModelView
    var addToCart: () -> ()
    var removeFromCart: () -> ()
    @State private var collapsed: Bool = true
    
    init(product: Binding<ProductModelView>,
         addToCartAction: @escaping () -> (),
         removeFromCartAction: @escaping () -> ()){
        self._product = product
        self.addToCart = addToCartAction
        self.removeFromCart = removeFromCartAction
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 100, alignment: .leading)
                
                VStack(spacing:5) {
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Divider()
                        .padding(.bottom, 15)
                    HStack{
                        Text(product.description)
                        Spacer()
                    }
                    
                    if !collapsed {
                        HStack(spacing: 10) {
                            
                            Text("\(product.price)€")
                                .bold()
                            
                            Spacer()
                            
                            if !product.isInCart {
                                Button {
                                    self.addToCart()
                                } label: {
                                    Image(systemName: "cart.badge.plus")
                                        .foregroundColor(Color.green)
                                }
                            } else {
                                
                                CartCapsule(count: self.$product.inCart)
                                Button {
                                    self.removeFromCart()
                                } label: {
                                    Image(systemName: "cart.badge.minus")
                                        .foregroundColor(Color.red)
                                }
                            }
                            
                            
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    }
                    
                }
            }
            .padding(.horizontal, 15)
            .padding(.top, 10)
        }
        .frame(maxHeight: collapsed ? 150 : .infinity)
        .background(Color.white.opacity(0.8).blur(radius: 20))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
        .onTapGesture {
            self.collapsed.toggle()
        }
    }
}
