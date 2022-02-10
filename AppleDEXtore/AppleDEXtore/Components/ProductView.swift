//
//  ProductView.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 10/2/22.
//

import SwiftUI

struct ProductView: View {
    var product: ProductModelView
    
    init(product: ProductModelView){
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 100, alignment: .leading)
                
                Spacer()
                
                VStack {
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Divider()
                    
                    Text(product.description)
                }
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 20)
        }
        .frame(maxHeight: 150)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
    }
}
