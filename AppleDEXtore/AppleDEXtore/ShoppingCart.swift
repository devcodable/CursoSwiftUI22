//
//  ShoppingCart.swift
//  AppleDEXtore
//
//  Created by Jorge Marciel Pariente on 10/2/22.
//

import SwiftUI

struct ShoppingCart: View {
    
    @State var cantidades : [Int] = [1, 2, 3]
    @State var navigateForward: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(Array($cantidades.enumerated()), id: \.offset) { index, cantidad in
                    ShoppintDetails(
                        cantidad: cantidad,
                        image: "scribble",
                        price: 56,
                        title: "Iphone 8",
                        deleteCallback: {
                            deleteItem(index: index)
                        }
                    )
                        .padding()
                }
            }
            Button(action: navigateToPayment) {
                Text("Pagar")
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color.purple)
                    )
            }
            .buttonStyle(.plain)
            .frame(height: 60)
            .padding([.bottom, .leading, .trailing])
            NavigationLink(isActive: self.$navigateForward) {
                Text("Payment")
            } label: {
                EmptyView()
            }
        }
        .background(Color.teal)
    }
    
    func deleteItem(index: Int) {
        print("\(index) deleted")
    }
    
    func navigateToPayment() {
        self.navigateForward = true
    }
    
}

struct ShoppintDetails: View {
    @Binding var cantidad: Int
    
    let image: String
    let price: Float
    let title: String
    
    let deleteCallback: () -> Void
    
    var body: some View {
        HStack() {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
            VStack {
                Text(title)
                    .font(.title)
                Spacer()
                Text(String(format: "%.0f $", price))
                    .font(.title2)
                HStack(alignment: .center) {
                    Menu {
                        Picker(selection: $cantidad) {
                            ForEach([0,1,2,3,4], id: \.self) {
                                Text("\($0)")
                            }
                        } label: {}
                    } label: {
                        Text("Cantidad: \(cantidad)")
                            .font(.title2)
                    }
                    Spacer()
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                        .onTapGesture(perform: deleteCallback)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(
                    style: StrokeStyle(lineWidth: 3, dash: [15.0])
                ).foregroundColor(.orange)
        )
    }
}



struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart()
    }
}
