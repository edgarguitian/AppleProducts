//
//  AppleProductsApp.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import SwiftUI

@main
struct AppleProductsApp: App {
    private let appDIContainer = AppDIContainer()
    // private let imageAuthenticationChallenge = ImageDownloadAuthenticationChallenge()

    var body: some Scene {
        WindowGroup {
            appDIContainer.productListView
        }
    }

    init() {
        // ImageDownloader.default.authenticationChallengeResponder = imageAuthenticationChallenge
    }
}
