//
//  AppleDEXtoreApp.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 10/2/22.
//

import SwiftUI

@main
struct AppleDEXtoreApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ShoppingCart()
                    .navigationViewStyle(.stack)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
