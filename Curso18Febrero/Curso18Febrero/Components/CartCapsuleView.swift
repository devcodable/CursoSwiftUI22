//
//  CartCapsuleView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import SwiftUI

struct CartCapsuleView: View {
    
    @Binding var count: Int
    
    var body: some View {
        HStack {
            Button {
                self.count -= 1
            } label: {
                Text("-")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 30)
            }
            .background(Color.gray)
            .frame(alignment: .leading)
            .allowsHitTesting(count > 1)
            .opacity(count > 1 ? 1 : 0.5)
            
            HStack {
                Spacer()
                Text("\(count)")
                Spacer()
            }
                .background(Color.white)
            
            Button {
                self.count += 1
            } label: {
                Text("+")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 30)
            }
            .background(Color.gray)
            .frame(alignment: .trailing)
            
        }
        .frame(width: 100)
        .clipShape(Capsule())
    }
}
