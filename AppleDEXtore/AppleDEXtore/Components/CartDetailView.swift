//
//  CartDetailView.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import SwiftUI

struct CartDetailView: View {
    @Binding var product: ProductModelView
    
    let deleteCallback: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack() {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100, maxHeight: 120)
                
                VStack(spacing: 15) {
                    Text(product.name).font(.title)
                    Text("\(product.price) €").font(.title2)
                    HStack(alignment: .center) {
                        Text("Cantidad:")
                            .font(.title2)
                        CartCapsule(count: self.$product.inCart)
                    }
                    .frame(maxWidth: .infinity)            }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [15.0, 0]))
                    .foregroundColor(.gray)
            )
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture(perform: deleteCallback)
                .padding()
        }
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

