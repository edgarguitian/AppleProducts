//
//  AppleProductItemView.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import SwiftUI

struct AppleProductItemView: View {

    var item: AppleProductListPresentable

    var body: some View {
        VStack(alignment: .leading) {
            HeaderImageView(urlString: item.image, height: 150)
            Text(item.title).font(.title)
            Text(item.price)
                .foregroundStyle(.red)
                .font(.title2)
        }
        .preferredColorScheme(.light)
    }
}
