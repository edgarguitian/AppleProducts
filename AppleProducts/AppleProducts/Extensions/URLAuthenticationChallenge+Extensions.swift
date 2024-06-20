//
//  URLAuthenticationChallenge+Extensions.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

extension URLAuthenticationChallenge {

    func trustServer(completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if self.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
            if let serverTrust = self.protectionSpace.serverTrust {
                let credential = URLCredential(trust: serverTrust)
                completionHandler(.useCredential, credential)
                return
            }
        }
        completionHandler(.performDefaultHandling, nil)
    }
}
