//
//  CatalogView.swift
//  Curso18Febrero
//
//  Created by David Cuñado Gil on 18/2/22.
//

import SwiftUI

struct CatalogView: View {
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

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
