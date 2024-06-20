//
//  AppleProductListFactory.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class AppleProductListFactory {
    private let apiDataTransferService: DataTransferService

    init(apiDataTransferService: DataTransferService) {
        self.apiDataTransferService = apiDataTransferService
    }

    // MARK: UI
    func createView() -> AppleProductListView<AppleProductListViewModel> {
        AppleProductListView(viewModel: createAppleProductListViewModel())
    }

    // MARK: View Model
    private func createAppleProductListViewModel() -> AppleProductListViewModel {
        AppleProductListViewModel(useCase: createFetchAppleProductListUseCase())
    }

    // MARK: Use Case
    private func createFetchAppleProductListUseCase() -> FetchAppleProductListType {
        FetchAppleProductList(repository: createFetchAppleProductListRepository())
    }

    // MARK: Repository
    private func createFetchAppleProductListRepository() -> FetchAppleProductListRepositoryType {
        FetchAppleProductListRepository(service: createAppleProductListService())
    }

    // MARK: Service
    private func createAppleProductListService() -> AppleProductListServiceType {
        return AppleProductListService(apiDataService: apiDataTransferService)
    }
}
