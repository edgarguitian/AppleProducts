//
//  AppleProductListViewModel.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class AppleProductListViewModel: AppleProductListViewModelType {

    @Published var products: [AppleProductListPresentable] = []
    @Published var isError: Bool = false
    @Published var error: String = ""
    var isEmpty: Bool { return products.isEmpty }
    var title: String = AppConstant.productListTitle
    private let appleProductListUseCase: FetchAppleProductListType!

    init(useCase: FetchAppleProductListType) {
        self.appleProductListUseCase = useCase
    }

    /// This method fetches products and catches error if any
    @MainActor func fetchProducts() async {
        do {
            let productList = try await appleProductListUseCase.fetchAppleProductList()
            self.products = self.transformFetchedProducts(products: productList)
            self.isError = false
        } catch {
            self.isError = true
            if let networkError = error as? NetworkError {
                self.error = networkError.description
            } else {
                self.error = error.localizedDescription
            }
        }
    }

    /// This method maps AppleProduct to AppleProductListPresentable
    /// - Parameter products:array of AppleProduct
    /// - Returns: array of AppleProductListPresentable
    private func transformFetchedProducts(products: [AppleProduct]) -> [AppleProductListPresentable] {
        products.map { AppleProductListPresentable(id: $0.productId,
                                           title: $0.title,
                                           description: $0.description,
                                                price: $0.price.getAmountWithCurrency(),
                                                category: $0.category.capitalized,
                                           image: $0.thumbnail) }
    }

    /// This method checks if the loader should be shown or not
    /// - Returns: True if there the product array is empty and error is not there
    func shouldShowLoader() -> Bool {
        return (isEmpty && !isError)
    }
}
