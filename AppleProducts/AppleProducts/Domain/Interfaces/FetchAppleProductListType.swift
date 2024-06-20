//
//  FetchAppleProductListType.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

protocol FetchAppleProductListType {
    func fetchAppleProductList() async throws -> [AppleProduct]
}
