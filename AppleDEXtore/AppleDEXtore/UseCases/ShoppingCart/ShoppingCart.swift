//
//  ShoppingCart.swift
//  AppleDEXtore
//
//  Created by Jorge Marciel Pariente on 10/2/22.
//

import SwiftUI

struct ShoppingCart: View {
    
    @SwiftUI.Environment(\.dismiss) var dismiss
    
    @Binding var cartItems: [ProductModelView]
    
    @State var navigateForward: Bool = false
    @State var showDialog: Bool = false
    
    var body: some View {
        VStack {
            if cartItems.count > 0 {
                ScrollView {
                    ForEach(0..<cartItems.count, id: \.self) { index in
                        CartDetailView(
                            cantidad: $cartItems[index].inCart,
                            image: cartItems[index].image,
                            price: cartItems[index].price,
                            title: cartItems[index].name,
                            deleteCallback: {
                                deleteItem(index: index)
                            }
                        )
                            .padding()
                    }
                }.padding(.top)
                Button(action: continueClicked) {
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
            } else {
                Text("El carrito de la compra está vacio.")
                Button(action: navigateBack) {
                    Text("Volver atras")
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
            }
            NavigationLink(isActive: self.$navigateForward) {
                Text("Payment")
            } label: {
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationViewStyle(.stack)
        .navigationBarTitle("", displayMode: .inline)
        .background(Color.teal)
        .alert("Estás seguro de que quieres continuar?", isPresented: $showDialog) {
            Button("Sí", action: navigateToPayment)
            Button("No", role: .cancel) {
                showDialog = false
            }
        }
    }
    
    func deleteItem(index: Int) {
        cartItems[index].inCart = 0
        cartItems[index].isInCart = false
        cartItems.remove(at: index)
    }
    
    func continueClicked() {
        self.showDialog = true
    }
    
    func navigateToPayment() {
        showDialog = false
        self.navigateForward = true
    }
    
    func navigateBack() {
        self.dismiss()
    }
}
