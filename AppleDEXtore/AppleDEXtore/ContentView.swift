//
//  ContentView.swift
//  AppleDEXtore
//
//  Created by David Cuñado and Jorge Marciel for 18/02/2022 SwiftUI Course
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
