//
//  CryptoWatchApi.swift
//  CryptoWatcher
//
//  Created by Ben on 1/14/18.
//

import Foundation
import then

/// Represents the Cryptowatch API Client
struct Cryptowatcher: Fetchable {
    let baseURL = "https://api.cryptowat.ch"
}

/**
 Represents the CPU allowance related to a request.
 
 Each client has an allowance of **8000000000 nanoseconds** (8 seconds) of CPU time per hour. The allowance is reset every hour on the hour.
 */
struct Allowance: Codable {
    /// How many nanoseconds that request took in nanoseconds.
    let cost: Int
    
    /// How many nanoseconds remain in your allowance.
    let remaining: Int
}

/// Represents basic information about the Cryptowatch API
struct ApiInfo: Codable {
    let revision: String
    let uptime: String
    let documentation: URL
    let indexes: Array<URL>
}

/// Respresents a response from `getApiInfo`.
struct GetApiInfo: Codable {
    let result: ApiInfo
    let allowance: Allowance
}

extension Cryptowatcher {
    /**
     Fetches current information about the API.
     
     *Note: You can use this to query your allowance without any extra result - this request costs very little.*
     
     *Example:* <https://api.cryptowat.ch>
     
     - Returns: A `Promise` for a `GetApiInfo` representing the response.
     */
    func getApiInfo() -> Promise<GetApiInfo> {
        return fetch(baseURL, type: GetApiInfo.self).then(decodeResult)
    }
}
