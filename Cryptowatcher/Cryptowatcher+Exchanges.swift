//
//  CryptoWatchApi+Exchanges.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation
import then

extension Cryptowatcher {
    /**
     Fetches a list of all supported exchanges.
     
     *Example:* <https://api.cryptowat.ch/exchanges>
     
     - Returns: A `Promise` for a `GetExchangeIndex` representing the response.
     */
    func getExchangeIndex() -> Promise<GetExchangeIndex> {
        let url = "\(baseURL)/exchanges"
        return fetch(url, type: GetExchangeIndex.self).then(decodeResult)
    }
    
    /**
     Fetches a single exchange, with associated routes.
     
     *Example:* <https://api.cryptowat.ch/exchanges/kraken>
     
     - Parameter exchange: A `String` representing the exchange.
     - Returns: A `Promise` for a `GetExchange` representing the response.
     */
    func getExchange(exchange: String) -> Promise<GetExchange> {
        let url = "\(baseURL)/exchanges/exchange"
        return fetch(url, type: GetExchange.self).then(decodeResult)
    }
    
    /**
     Fetches a single exchange, with associated routes.
     
     *Example:* <https://api.cryptowat.ch/exchanges/kraken>
     
     - Parameter exchange: An `Exchange.Symbol` representing the exchange.
     - Returns: A `Promise` for a `GetExchange` representing the response.
     */
    func getExchange(exchange: Exchange.Symbol) -> Promise<GetExchange> {
        return getExchange(exchange: exchange.rawValue)
    }
}
