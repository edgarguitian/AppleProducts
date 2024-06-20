//
//  AppleProductListLayout.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import SwiftUI

struct AppleProductListLayout: View {

    let items: [AppleProductListPresentable]

    var body: some View {
        List {
            ForEach(items, id: \.id) { item in
                NavigationLink(value: item) {
                    AppleProductItemView(item: item)
                }
            }
        }
        .navigationDestination(for: AppleProductListPresentable.self, destination: { item in
            /// Move to Apple Product Details View
            AppleProductDetailView(item: item)
        })
        .preferredColorScheme(.light)
    }
}
