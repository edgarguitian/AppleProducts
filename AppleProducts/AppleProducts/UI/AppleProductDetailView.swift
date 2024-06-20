//
//  AppleProductDetailView.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import SwiftUI

struct AppleProductDetailView: View {

    let item: AppleProductListPresentable

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HeaderImageView(urlString: item.image, height: 300)
                Text(item.title)
                    .font(.title)
                Text(item.price)
                    .font(.title2)
                Text(item.description)
                    .font(.title3)
            }
            .padding(10)
            .navigationTitle(item.category)
            .navigationBarTitleDisplayMode(.inline)
        }.preferredColorScheme(.light)
    }
}
