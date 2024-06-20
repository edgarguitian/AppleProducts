//
//  SharedURLSessionDelegate.swift
//  AppleProducts
//
//  Created by Edgar Guitian Rey on 20/6/24.
//

import Foundation

final class SharedURLSessionDelegate: NSObject, URLSessionDelegate {

    func urlSession(
        _ session: URLSession,
        didReceive challenge: URLAuthenticationChallenge,
        completionHandler: @escaping (
            URLSession.AuthChallengeDisposition,
            URLCredential?
        ) -> Void
    ) {
        challenge.trustServer { challangeDisposition, credential in
            completionHandler(challangeDisposition, credential)
        }
    }
}
