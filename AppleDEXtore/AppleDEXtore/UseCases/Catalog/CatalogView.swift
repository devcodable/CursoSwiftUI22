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
                
                // MARK: Product List
                ScrollView {
                    ForEach(self.$viewModel.catalog.products) { product in
                        if product.category.wrappedValue == self.viewModel.selectedCategory {
                            
                            ProductView(product: product) {
                                self.viewModel.cartList.append(product.wrappedValue)
                                product.isInCart.wrappedValue = true
                                product.inCart.wrappedValue = 1
                                for p in self.viewModel.cartList {
                                    print(p.name)
                                }
                            } removeFromCartAction: {
                                self.viewModel.cartList = self.viewModel.cartList.filter { p in
                                    p.id != product.id
                                }
                                product.isInCart.wrappedValue = false
                                product.inCart.wrappedValue = 0
                                for p in self.viewModel.cartList {
                                    print(p.name)
                                }
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            .background(Color.pink.opacity(0.3))
            .padding(.top, 50)
            
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
            .frame(width: 60, height: 60)
            .clipped()
            .background(Color.purple)
            .clipShape(Circle())
            .padding([.trailing, .bottom], 30)
            .shadow(radius: 10)
            .overlay() {
                if !self.viewModel.cartList.isEmpty {
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
            .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 60)
            NavigationLink(isActive: self.$viewModel.navigateToShoppingCart) {
                ShoppingCart(cartItems: self.$viewModel.cartList)
            } label: {
                EmptyView()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    func CartButtonPushed() {
        self.viewModel.navigateToCart()
    }
}
