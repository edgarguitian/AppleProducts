//
//  AppDIContainer.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class AppDIContainer {

    lazy private var apiDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: AppConfiguration.baseURL)
        let sessionManager = DefaultNetworkSessionManager(session: SharedURLSession.shared)
        let networkManager = DefaultNetworkManager(config: config, sessionManager: sessionManager)
        return DefaultDataTransferService(networkManager: networkManager)
    }()

    lazy var productListView: AppleProductListView = {
        let appleProductsModule = AppleProductListFactory(apiDataTransferService: apiDataTransferService)
        return appleProductsModule.createView()
    }()
}
