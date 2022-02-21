//
//  ProductView.swift
//  Curso18Febrero
//
//  Created by Jorge Marciel Pariente on 18/2/22.
//

import SwiftUI

struct ProductView: View {
    
    @Binding var product: ProductModelView
    @State private var showModal = false
    var addToCart: () -> ()
    var removeFromCart: () -> ()
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 100)
                VStack {
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Divider()
                        .padding(.bottom)
                    
                    HStack {
                        Text(product.description)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                    }
                }
                .padding(.leading)
            }
            .padding()
            
        }
        .frame(maxHeight: 150)
        .background {
            Color.white.opacity(0.8).blur(radius: 20)
        }
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
        .sheet(isPresented: self.$showModal) {
            ProductDetailView(product: $product) {
                self.addToCart()
            } removeFromCart: {
                self.removeFromCart()
            }
        }
        .onTapGesture {
            self.showModal.toggle()
        }
    }
}
