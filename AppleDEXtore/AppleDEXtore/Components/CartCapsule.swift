//
//  CartCapsule.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import SwiftUI

struct CartCapsule: View {
    
    @Binding var count: Int
    
    var body: some View {
        HStack(spacing: 0) {
            
            // MARK: Minus button
            // 1.-  Con '.allowsHitTesting()' establecemos cuándo se puede interaccionar con el componente en función de un Bool
            // 2.-  Operador ternario para establecer la opacidad del componente.
            Button {
                count-=1
            } label: {
                Text("-")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 30)
            }
            .background(Color.gray)
            .frame(alignment: .leading)
            .allowsHitTesting(count > 1)        // 1
            .opacity(count > 1 ? 1 : 0.5)       // 2
            
            HStack {
                Spacer()
                Text("\(count)")
                Spacer()
            }
            .background(Color.white)
            
            Button {
                count+=1
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
