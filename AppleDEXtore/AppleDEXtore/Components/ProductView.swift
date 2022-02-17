//
//  ProductView.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import SwiftUI

struct ProductView: View {
    
    @Binding var product: ProductModelView
    var addToCart: () -> ()
    var removeFromCart: () -> ()
    @State private var showModal: Bool = false
    
    init(product: Binding<ProductModelView>,
         addToCartAction: @escaping () -> (),
         removeFromCartAction: @escaping () -> ()){
        
        // La variable 'product' es de tipo Binding, es decir, no asignamos un valor, asignamos una referencia.
        // Para expresar esto predeceremos la variable con '_'
        self._product = product
        self.addToCart = addToCartAction
        self.removeFromCart = removeFromCartAction
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 10) {
                
                // 1.-  Para cambiar el tamaño de una imagen esta deberá ser establecida como 'resizable'.
                // 2.-  El modificador '.frame()' tiene dos inicializadores:
                //          - Uno para valores exactos '.frame(width: x, height: y, alignment: z)'
                //          - Y otro que establece un rango de valores: min, ideal y max para width y height, siendo todos opcionales
                //      Estos inicializadores no se pueden mezclar.
                // 3.-  Con '.ontapGesture() { }' añadimos un listener para el evento tocar y la acción a realizar cuando se produzca.
                // 4.-  Para mostrar vistas modales utilizaremos '.sheet()'.
                Image(product.image)
                    .resizable()                                    // 1
                    .scaledToFit()
                    .frame(maxWidth: 80, maxHeight: 100, alignment: .leading)     // 2
                    
                VStack(spacing: 5) {
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Divider()
                        .padding(.bottom, 15)
                    HStack{
                        Text(product.description)
                        
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
                
        }
        .frame(maxHeight: 150)
        .background(Color.white.opacity(0.8).blur(radius: 20))
        .cornerRadius(15)
        .shadow(radius: 10)
        .padding(.horizontal, 20)
        .onTapGesture {                                             // 3
            self.showModal.toggle()
        }
        .sheet(isPresented: self.$showModal) {                      // 4
            ProductDetailView(product: $product,
                              addToCart: addToCart,
                              removeFromCart: removeFromCart)
        }
    }
}

struct ProductDetailView: View {
    
    @Binding var product: ProductModelView
    var addToCart: () -> ()
    var removeFromCart: () -> ()
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 300, alignment: .center)
            
            VStack(alignment: .center) {
                
                // 1.-  Con LinearGradient establecemos un degradado de los colores que elijamos.
                // 2.-  Con '.mask()' le decimos a qué componente queremos aplicárselo
                LinearGradient(gradient: Gradient(colors: [.pink, .blue]),      // 1
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .mask(Text(product.name)                                    // 2
                            .font(.largeTitle)
                            .bold())
                    .frame(maxHeight: 40)
                    .padding(.top, 20)
                
                Divider()
                
                ScrollView {
                    Text(product.description)
                        .multilineTextAlignment(.center)
                }
                
                HStack(spacing: 10) {

                    Text("\(product.price)€")
                        .font(.title)
                        .bold()

                    Spacer()

                    if !product.isInCart {
                        Button {
                            self.addToCart()
                        } label: {
                            Image(systemName: "cart.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                                .foregroundColor(Color.white)
                                .shadow(radius: 5)
                        }
                    } else {
                        CartCapsule(count: self.$product.inCart)
                        
                        Button {
                            self.removeFromCart()
                        } label: {
                            Image(systemName: "cart.badge.minus")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                                .foregroundColor(Color.red)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                
            }
            .padding(.horizontal, 20)
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.mint, .indigo, .pink]),
                           startPoint: .topTrailing,
                           endPoint: .bottomLeading)
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
        )
    }
}
