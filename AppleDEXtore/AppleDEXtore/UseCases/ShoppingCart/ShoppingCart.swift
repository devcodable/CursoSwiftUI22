//
//  ShoppingCart.swift
//  AppleDEXtore
//
//  Created by Jorge Marciel Pariente on 10/2/22.
//

import SwiftUI

struct ShoppingCart: View {
    
    @Binding var cartItems: [ShoppingCartModelView]
    
    @State var navigateForward: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<cartItems.count, id: \.self) { index in
                    ShoppintDetails(
                        cantidad: $cartItems[index].cantidad,
                        image: cartItems[index].product.image,
                        price: cartItems[index].product.price,
                        title: cartItems[index].product.name,
                        deleteCallback: {
                            deleteItem(index: index)
                        }
                    )
                        .padding()
                }
            }.padding(.top)
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
        .navigationViewStyle(.stack)
        .navigationBarTitle("", displayMode: .inline)
        
        .background(Color.teal)
    }
    
    func deleteItem(index: Int) {
        cartItems.remove(at: index)
    }
    
    func navigateToPayment() {
        self.navigateForward = true
    }
    
}

struct ShoppintDetails: View {
    @Binding var cantidad: Int
    
    let image: String
    let price: Double
    let title: String
    
    let deleteCallback: () -> Void
    
    var body: some View {
        HStack() {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 100)
            VStack {
                Text(title)
                    .font(.title)
                Spacer()
                Text(String(format: "%.0f $", price))
                    .font(.title2)
                HStack(alignment: .center, spacing: 25) {
                    Menu {
                        Picker(selection: $cantidad) {
                            ForEach(0...5, id: \.self) {
                                Text("\($0)")
                            }
                        } label: {}
                    } label: {
                        Text("Cantidad: \(cantidad)")
                            .font(.title2)
                    }
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
