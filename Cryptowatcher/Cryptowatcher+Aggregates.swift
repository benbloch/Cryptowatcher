//
//  CryptoWatchApi+Aggregates.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation
import then

extension Cryptowatcher {
    /**
     Fetches the current price for all supported markets.
     
     *Note: Some values may be out of date by a few seconds.*
    
     *Example:* <https://api.cryptowat.ch/markets/prices>
    
     - Returns: A `Promise` for a `GetAggregatePrices` representing the response.
    */
    func getAggregatePrices() -> Promise<GetAggregatePrices> {
        let url = "\(baseURL)/markets/prices"
        return fetch(url, type: GetAggregatePrices.self).then(decodeResult)
    }
    
    /**
     Fetches the market summary for all supported markets.
     
     *Note: Some values may be out of date by a few seconds.*
     
     *Example:* <https://api.cryptowat.ch/markets/summaries>
     
     - Returns: A `Promise` for a `GetAggregateSummaries` representing the response.
     */
    func getAggregateSummaries() -> Promise<GetAggregateSummaries> {
        let url = "\(baseURL)/markets/summaries"
        return fetch(url, type: GetAggregateSummaries.self).then(decodeResult)
    }
}
