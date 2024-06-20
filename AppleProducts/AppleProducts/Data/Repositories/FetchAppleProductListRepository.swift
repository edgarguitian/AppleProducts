//
//  FetchAppleProductListRepository.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class FetchAppleProductListRepository: FetchAppleProductListRepositoryType {
    private let service: AppleProductListServiceType

    init(service: AppleProductListServiceType) {
        self.service = service
    }

    func fetchAppleProductList() async throws -> [AppleProduct] {
        try await service.fetchAppleProductListFromNetwork().products.map { $0.toDomain() }
    }
}
