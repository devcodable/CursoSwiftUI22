//
//  CatalogView.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 10/2/22.
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: CatalogViewModel = CatalogViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                
                Picker("Section", selection: self.$viewModel.selectedCategory) {
                    Text("iPhone").tag(ProductCategory.iphone)
                    Text("Mac").tag(ProductCategory.mac)
                    Text("iPad").tag(ProductCategory.ipad)
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                
                ScrollView {
                    ForEach(self.viewModel.catalog.products) { product in
                        if product.category == self.viewModel.selectedCategory {
                            ProductView(product: product)
                        }
                    }
                }
            }
            .background(Color.pink.opacity(0.3))
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: CartButtonPushed){
                        Group {
                            if self.viewModel.cartList.isEmpty {
                                Image(systemName: "cart")
                            } else {
                                Image(systemName: "cart.fill")
                            }
                        }
                        .frame(minWidth: 56)
                        .foregroundColor(.white)
                    }
                    .frame(height: 100)
                    .background(Color.purple)
                    .clipShape(Circle())
                    .padding(.trailing, 30)
                    .shadow(radius: 10)
                }
            }
            NavigationLink(isActive: self.$viewModel.navigateToShoppingCart) {
                ShoppingCart(cartItems: self.$viewModel.cartList)
            } label: {
                EmptyView()
            }
        }
        .onAppear {
            self.viewModel.getData()
        }
    }
    
    func CartButtonPushed() {
        self.viewModel.navigateToCart()
    }
}
