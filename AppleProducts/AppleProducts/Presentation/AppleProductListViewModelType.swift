//
//  AppleProductListViewModelType.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

protocol AppleProductListViewModelType: ObservableObject {
    var products: [AppleProductListPresentable] { get set }
    var isError: Bool { get }
    var error: String { get }
    var isEmpty: Bool { get }
    var title: String { get }
    func shouldShowLoader() -> Bool
    func fetchProducts() async
}
