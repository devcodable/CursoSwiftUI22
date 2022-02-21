//
//  CatalogView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: CatalogViewModel = CatalogViewModel()
    @State private var selectedCategory: ProductCategory = .iphone
    
    var body: some View {
        ZStack {
            VStack {
                Picker("Categories", selection: $selectedCategory) {
                    Text("iPhone").tag(ProductCategory.iphone)
                    Text("iPad").tag(ProductCategory.ipad)
                    Text("Mac").tag(ProductCategory.mac)
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                
                ScrollView {
                    
                    ForEach(self.$viewModel.catalog.products) { product in
                        
                        if product.category.wrappedValue == selectedCategory {
                            
                            ProductView(product: product) {
                                self.viewModel.cartItems.append(product.wrappedValue)
                                product.isInCart.wrappedValue = true
                                product.cantityInCart.wrappedValue = 1
                                
                            } removeFromCart: {
                                product.isInCart.wrappedValue = false
                                product.cantityInCart.wrappedValue = 0
                                
                                self.viewModel.cartItems = self.viewModel.cartItems.filter({ p in
                                    p.id != product.id
                                })
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(selectedCategory.getBackgroundColor().opacity(0.3))
            
            NavigationLink(destination: CartView(cartitems: self.$viewModel.cartItems)) {
                Group {
                    if self.viewModel.cartItems.isEmpty {
                        Image(systemName: "cart")
                    } else {
                        Image(systemName: "cart.fill")
                    }
                }
                .frame(minWidth: 56)
                .foregroundColor(.white)
            }
            .frame(width: 60, height: 60)
            .background(Color.purple)
            .clipShape(Circle())
            .shadow(radius: 10)
            .padding([.bottom, .trailing], 30)
            .overlay() {
                if !self.viewModel.cartItems.isEmpty {
                    HStack {
                        Text("\(self.viewModel.getCartCount())")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(5)
                    }
                    .background(Color.blue)
                    .clipShape(Circle())
                    .offset(x: 5, y: -35)
                }
            }
            .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 100)

        }
    }
}
