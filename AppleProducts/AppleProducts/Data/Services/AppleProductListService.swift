//
//  AppleProductListService.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class AppleProductListService: AppleProductListServiceType {
    private let apiDataService: DataTransferService

    init(apiDataService: DataTransferService) {
        self.apiDataService = apiDataService
    }

    func fetchAppleProductListFromNetwork() async throws -> AppleProductListDTO {
        let productListNetworkRequest = DefaultNetworkRequest(path: APIEndpoint.products, method: .get)
        return try await apiDataService.request(request: productListNetworkRequest)
    }
}
