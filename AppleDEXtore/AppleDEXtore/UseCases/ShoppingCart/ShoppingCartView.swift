//
//  ShoppingCart.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import SwiftUI

struct ShoppingCartView: View {
    
    @SwiftUI.Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: ShoppingCartViewModel
    
    @State var navigateForward: Bool = false
    @State var showDialog: Bool = false
    
    init(cartItems: Binding<[ProductModelView]>) {
        self.viewModel = ShoppingCartViewModel(cartItems: cartItems)
    }
    
    var body: some View {
        VStack {
            if self.viewModel.cartItems.count > 0 {
                ScrollView {
                    ForEach(0..<self.viewModel.cartItems.count, id: \.self) { index in
                        CartDetailView(
                            product: self.viewModel.cartItems[index],
                            deleteCallback: {
                                deleteItem(index: index)
                            }
                        )
                            .padding()
                    }
                }.padding(.top)
                
                Spacer()
                
                Text("Total: \(self.viewModel.getTotal())€")
                    .font(.title2)
                    .bold()
                
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
        .background(Color.teal.opacity(0.3))
        .alert("Estás seguro de que quieres continuar?", isPresented: $showDialog) {
            Button("Sí", action: navigateToPayment)
            Button("No", role: .cancel) {
                showDialog = false
            }
        }
    }
    
    func deleteItem(index: Int) {
        self.viewModel.cartItems[index].inCart.wrappedValue = 0
        self.viewModel.cartItems[index].isInCart.wrappedValue = false
        self.viewModel.cartItems.wrappedValue.remove(at: index)
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
