//
//  CartCapsule.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 11/2/22.
//

import SwiftUI

struct CartCapsule: View {
    
    @Binding var count: Int
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                if count > 1 {
                    count-=1
                }
            } label: {
                Text("-")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 30)
            }
            .background(Color.gray)
            .frame(alignment: .leading)
            
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
