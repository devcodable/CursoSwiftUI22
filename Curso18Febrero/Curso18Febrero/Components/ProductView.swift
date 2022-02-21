//
//  ProductView.swift
//  Curso18Febrero
//
//  Created by Jorge Marciel Pariente on 18/2/22.
//

import SwiftUI

struct ProductView: View {
    let image: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 100)
                VStack {
                    Text(title)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Divider()
                        .padding(.bottom)
                    Text(description)
                        .font(.system(size: 14, weight: .semibold))
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
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(
            image: "iphone11",
            title: "Iphone 13",
            description: "Como un ipad Como un ipad Como un ipad Como un ipad"
        )
            .previewLayout(.sizeThatFits)
    }
}
