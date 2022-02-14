//
//  ContentView.swift
//  AppleDEXtore
//
//  Created by David Cuñado Gil on 10/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CatalogView()
                .navigationViewStyle(.stack)
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
