//
//  FetchAppleProductList.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class FetchAppleProductList: FetchAppleProductListType {
    private let repository: FetchAppleProductListRepositoryType

    init(repository: FetchAppleProductListRepositoryType) {
        self.repository = repository
    }

    func fetchAppleProductList() async throws -> [AppleProduct] {
        try await repository.fetchAppleProductList()
    }
}
