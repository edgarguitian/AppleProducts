//
//  NetworkConfigurable.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

protocol NetworkConfigurable {
    var baseURL: String { get }
    var headers: [String: String] { get }
}

class ApiDataNetworkConfig: NetworkConfigurable {

    let baseURL: String
    let headers: [String: String]

     init(baseURL: String,
          headers: [String: String] = [:]) {
        self.baseURL = baseURL
        self.headers = headers
    }
}
