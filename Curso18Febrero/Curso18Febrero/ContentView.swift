//
//  ContentView.swift
//  Curso18Febrero
//
//  Created by Jorge Marciel Pariente on 18/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            CatalogView()
                .navigationViewStyle(.stack)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

