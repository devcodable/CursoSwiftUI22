//
//  CartDetailView.swift
//  AppleDEXtore
//
//  Created by Jorge Marciel Pariente on 14/2/22.
//

import SwiftUI

struct CartDetailView: View {
    @Binding var cantidad: Int
    
    let image: String
    let price: Int
    let title: String
    
    let deleteCallback: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack() {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                VStack(spacing: 15) {
                    Text(title).font(.title)
                    Text("\(price) €").font(.title2)
                    HStack(alignment: .center) {
                        Text("Cantidad:")
                            .font(.title2)
                        CartCapsule(count: $cantidad)
                    }
                    .frame(maxWidth: .infinity)            }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        style: StrokeStyle(lineWidth: 3, dash: [15.0])
                    ).foregroundColor(.orange)
            )
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture(perform: deleteCallback)
                .padding()
        }
    }
}

