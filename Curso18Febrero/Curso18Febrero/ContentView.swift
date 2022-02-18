//
//  ContentView.swift
//  Curso18Febrero
//
//  Created by Jorge Marciel Pariente on 18/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                ProductView(
                    image: "ipad",
                    title: "Iphone 13",
                    description: "Como un ipad Como un ipad Como un ipad Como un ipad"
                )
                ProductView(
                    image: "iphone11",
                    title: "Iphone 13",
                    description: "Como un ipad Como un ipad Como un ipad Como un ipad"
                )
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.pink.opacity(0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

