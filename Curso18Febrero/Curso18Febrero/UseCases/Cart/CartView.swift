//
//  CartView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var viewModel: CartViewModel
    @State private var showAlert = false
    
    @SwiftUI.Environment(\.dismiss) var dismiss
    
    init(cartitems: Binding<[ProductModelView]>) {
        self.viewModel = CartViewModel(cartItems: cartitems)
        print("init")
    }
    
    var body: some View {
        VStack {
            if self.viewModel.cartItems.count > 0{
                ScrollView {
                    ForEach(self.viewModel.cartItems) { item in
                        CartDetailView(product: item)
                    }
                }
                
                Spacer()
                
                Text("Total: \(self.viewModel.getTotal())€")
                
                Button {
                    self.showAlert.toggle()
                } label: {
                    Text("Finalizar compra")
                }

                
            } else {
                Text("No hay productos")
                Button {
                    self.dismiss()
                } label: {
                    Text("Seguir comprando")
                }
                .buttonStyle(.plain)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .background(Color.purple)
            }
        }
        .background(Color.teal.opacity(0.3))
        .alert("Está seguro?", isPresented: $showAlert) {
            Button("sí", action: { })
            Button("No", role: .cancel) {
                self.showAlert = false
            }
        }
        .onAppear {
            print("holaaa")
        }
        .onDisappear {
            print("adioos")
        }
    }
}
