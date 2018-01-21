//
//  CryptoWatchApi+Pairs.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation
import then

extension Cryptowatcher {
    /**
     Fetches all pairs (in no particular order).
     
     *Example:* <https://api.cryptowat.ch/pairs>
     
     - Returns: A `Promise` for a `GetPairIndex` representing the response.
     */
    func getPairIndex() -> Promise<GetPairIndex> {
        let url = "\(baseURL)/pairs"
        return fetch(url, type: GetPairIndex.self).then(decodeResult)
    }
    
    /**
     Fetches a single pair. Lists all `Markets` for this pair.
     
     *Example:* <https://api.cryptowat.ch/pairs/ethbtc>
     
     - Parameter pair: A `String` representing the pair (ex. `"ethbtc"`).
     - Returns: A `Promise` for a `GetPair` representing the response.
     */
    func getPair(pair: String) -> Promise<GetPair> {
        let url = "\(baseURL)/pairs/\(pair)"
        return fetch(url, type: GetPair.self).then(decodeResult)
    }
}
