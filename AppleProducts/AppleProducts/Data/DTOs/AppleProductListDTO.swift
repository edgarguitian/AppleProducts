//
//  AppleProductListDTO.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

struct AppleProductListDTO: Decodable {
    let products: [AppleProductDataListDTO]
}

struct AppleProductDataListDTO: Decodable {
    let productId: Int
        let title: String?
        let description: String?
        let price: Double?
        let discountPercentage: Double?
        let rating: Double?
        let stock: Int?
        let brand: String?
        let category: String?
        let thumbnail: String?
        let images: [String]?
        enum CodingKeys: String, CodingKey {
            case productId = "id"
            case title
            case description
            case price
            case discountPercentage
            case rating
            case stock
            case brand
            case category
            case thumbnail
            case images
        }
}

extension AppleProductDataListDTO {

    func toDomain() -> AppleProduct {
        .init(productId: productId,
              title: title ?? "",
              description: description ?? "",
              price: price ?? 0,
              category: category ?? "",
              thumbnail: thumbnail ?? "")
    }
}
