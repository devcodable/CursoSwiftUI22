//
//  CatalogView.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
//

import SwiftUI

struct CatalogView: View {
    
    @ObservedObject var viewModel: CatalogViewModel = CatalogViewModel()
    
    var body: some View {
        
        //  Stack que por defecto coloca los componentes en el centro de la vista. Puede colocar componentes uno encima de otro.
        ZStack {
            
            // Stack que coloca los componentes verticalmente, cada uno debajo del anterior.
            VStack {
                
                // MARK: Segmented Control for product section
                // 1.- El componente Picker se mostrará según el estilo que se le aplique, en este caso será de tipo segmented.
                Picker("Section", selection: self.$viewModel.selectedCategory) {
                    Text("iPhone").tag(ProductCategory.iphone)
                    Text("Mac").tag(ProductCategory.mac)
                    Text("iPad").tag(ProductCategory.ipad)
                }
                .pickerStyle(.segmented)            // 1
                .padding(.vertical, 30)
                .padding(.horizontal, 20)
                
                // MARK: Product List
                // 1.-  Para mostrar la lista de productos utilizamos un ScrollView
                // 2.-  El iterador 'ForEach()' nos servirá únicamente para construir vistas.
                //      Para ello, el modelo a recorrer deberá ser 'Identifiable', es decir, cada elemento deberá tener un ID único.
                //      Para cumplir este criterio también se puede indicar que cada vista será única e identificable añadiendo el
                //      parámetro "id: \.self", pero esto es considerado una mala práctica y se recomienda usarlo lo menos posible.
                //      Si lo que queremos es recorrer y modificar una estructura de datos, y no crear vistas, usaremos el iterador 'for item in ...'
                // 3.-  Importante recordar que el modificador '.background()' no se limita a colores e imágenes,
                //      sino que se le puede asignar cualquier tipo de vista
                ScrollView {                                                                    // 1
                    ForEach(self.$viewModel.catalog.products) { product in                      // 2
                        if product.category.wrappedValue == self.viewModel.selectedCategory {
                            
                            ProductView(product: product) {
                                self.viewModel.cartList.append(product.wrappedValue)
                                product.isInCart.wrappedValue = true
                                product.inCart.wrappedValue = 1
                            } removeFromCartAction: {
                                self.viewModel.cartList = self.viewModel.cartList.filter { p in
                                    p.id != product.id
                                }
                                product.isInCart.wrappedValue = false
                                product.inCart.wrappedValue = 0
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            .background(self.viewModel.selectedCategory.getBackgroundColor().opacity(0.3))      // 3
            .padding(.top, 50)
            
            // MARK: Shopping cart button
            // 1.-  Utilizaremos 'NavigationLink' para indicar a qué vista queremos navegar.
            //      Para que esto funcione debe estar dentro de un NavigationView (en este caso lo declaramos en el ContentView)
            // 2.-  El elemento 'Group' sirve para englobar componentes y aplicarles los modificadores a cada uno de ellos,
            //      no al conjunto total (como pasaría con un Stack).
            //      SwiftUI limita el número de vistas en el mismo nivel a 10, si se supera no compilará mostrando un error poco descriptivo.
            //      Es decir, si contamos con más de 10 Stacks al mismo nivel la aplicación no compilará.
            //      Esto se puede resolver fácilmente englobando todas estas vistas en un Group.
            // 3.-  El modificador '.clipShape()' aplicará al componente la forma que le indiquemos.
            // 4.-  El modificador '.overlay()' sirve para colocar vistas encima de otras.
            // 5.-  El modificador '.offset()' posicionará el componente afectado en función de la posición del padre
            // 6.-  El modificador '.position()' posicionará el componente afectado de manera absoluta
            NavigationLink(destination: ShoppingCartView(cartItems: self.$viewModel.cartList)) {      // 1
                
                Group {                                     // 2
                    if self.viewModel.cartList.isEmpty {
                        Image(systemName: "cart")
                    } else {
                        Image(systemName: "cart.fill")
                    }
                }
                .frame(minWidth: 56)
                .foregroundColor(.white)
            }
            .frame(width: 60, height: 60)
            .background(Color.purple)
            .clipShape(Circle())                                // 3
            .padding([.trailing, .bottom], 30)
            .shadow(radius: 10)
            .overlay() {                                        // 4
                if !self.viewModel.cartList.isEmpty {
                    HStack {
                        Text("\(self.viewModel.getCartCount())")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(5)
                    }
                    .background(Color.blue)
                    .clipShape(Circle())
                    .offset(x: 5, y: -35)                       // 5
                }
            }
            .position(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 60)      // 6
        }
        .edgesIgnoringSafeArea(.all)
        // Por defecto toda pantalla incluye una "safe area", es decir, parte de la pantalla (arriba y abajo) que no podremos utilizar
        // Para evitar esta restricción usaremos el modificador '.edgesIgnoringSafeArea()' o '.ignoresSafeArea()'
    }
}
