//
//  AppleProductListView.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import SwiftUI

struct AppleProductListView<ViewModel>: View where ViewModel: AppleProductListViewModelType {

    @ObservedObject private var viewModel: ViewModel
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            if viewModel.shouldShowLoader() {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                AppleProductListLayout(items: viewModel.products)
                    .overlay {
                        if viewModel.isError {
                            ErrorView(errorTitle: AppConstant.errorTitle, errorDescription: viewModel.error) {
                                Task {
                                    await fetchProducts()
                                }
                            }
                        }
                    }
                    .navigationTitle(viewModel.title)
            }
        }
        .task {
            await fetchProducts()
        }
    }

    private func fetchProducts() async {
        await viewModel.fetchProducts()
    }
}

struct AppleProductListView_Previews: PreviewProvider {
    static var previews: some View {
        AppleProductListView(viewModel: AppleProductListView_Previews.getViewModel())
    }
}

extension AppleProductListView_Previews {

    static func getViewModel() -> ProductListViewModelMock {
        return ProductListViewModelMock()
    }

    class ProductListViewModelMock: AppleProductListViewModelType {

        func shouldShowLoader() -> Bool {isEmpty && isError}

        var products: [AppleProductListPresentable] = [
            .init(
                id: 1,
                title: "Title 1",
                description: "Description 1",
                price: "$100",
                category: "iPhone",
                image: "https://cdn.dummyjson.com/product-images/1/thumbnail.jpg"
            ),
            .init(
                id: 2,
                title: "Title 2",
                description: "Description 2",
                price: "$200",
                category: "iPhone",
                image: "https://cdn.dummyjson.com/product-images/2/thumbnail.jpg"
            )
        ]
        var isEmpty: Bool { return products.isEmpty }
        var isError: Bool = false
        var error: String = "Error"
        var title: String = "Products"
        func fetchProducts() async {}
    }
}
