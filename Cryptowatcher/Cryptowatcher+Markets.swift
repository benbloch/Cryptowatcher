//
//  CryptoWatchApi+Markets.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation
import then

extension Cryptowatcher {
    /**
     Fetches a list of all supported markets.
     
     *Example:* <https://api.cryptowat.ch/markets>
     
     - Returns: A `Promise` for a `GetMarketIndex` representing the response.
     */
    func getMarketIndex() -> Promise<GetMarketIndex> {
        let url = "\(baseURL)/markets"
        return fetch(url, type: GetMarketIndex.self).then(decodeResult)
    }
    
    /**
     Fetches a single market, with associated routes.
     
     *Example:* <https://api.cryptowat.ch/markets/gdax/btcusd>
     
     - Parameters:
        - exchange: A `String` symbolizing the exchange.
        - pair: A `String` representing the pair.
     
     - Returns: A `Promise` for a `GetMarket` representing the response.
     */
    func getMarket(exchange: String, pair: String) -> Promise<GetMarket> {
        let url = "\(baseURL)/markets/\(exchange)/\(pair)"
        return fetch(url, type: GetMarket.self).then(decodeResult)
    }
    
    /**
     Fetches a market’s last price.
     
     *Example:* <https://api.cryptowat.ch/markets/gdax/btcusd/price>
     
     - Parameters:
        - exchange: A `String` symbolizing the exchange.
        - pair: A `String` representing the pair.
     
     - Returns: A `Promise` for a `GetMarketPrice` representing the response.
     */
    func getMarketPrice(exchange: String, pair: String) -> Promise<GetMarketPrice> {
        let url = "\(baseURL)/markets/\(exchange)/\(pair)/price"
        return fetch(url, type: GetMarketPrice.self).then(decodeResult)
    }
    
    /**
     Fetches a market’s last price as well as other stats based on a 24-hour sliding window.
        - High price
        - Low price
        - % change
        - Absolute change
        - Volume
     
     *Example:* <https://api.cryptowat.ch/markets/gdax/btcusd/summary>
     
     - Parameters:
        - exchange: A `String` symbolizing the exchange.
        - pair: A `String` representing the pair.
     
     - Returns: A `Promise` for a `GetMarketSummary` representing the response.
     */
    func getMarketSummary(exchange: String, pair: String) -> Promise<GetMarketSummary> {
        let url = "\(baseURL)/markets/\(exchange)/\(pair)/summary"
        return fetch(url, type: GetMarketSummary.self).then(decodeResult)
    }
    
    /**
     Fetches a market’s most recent trades, incrementing chronologically.
     
     *Example:*
     
     <https://api.cryptowat.ch/markets/gdax/btcusd/trades?limit=100&since=1481663244>
     
     - Parameters:
        - exchange: A `String` symbolizing the exchange.
        - pair: A `String` representing the pair.
        - limit: Limit amount of trades returned. Defaults to 50.
        - since: Only return trades at or after this UNIX timestamp.
     
     - Returns: A `Promise` for a `GetMarketSummary` representing the response.
     
     */
    func getMarketTrades(exchange: String, pair:String, limit: Int?, since: Int?) -> Promise<GetMarketTrades> {
        var url = "\(baseURL)/markets/\(exchange)/\(pair)/trades"
        var params: Dictionary<String, String> = [:]
        
        if let limit = limit {
            params["limit"] = String(limit)
        }
        
        if let since = since {
            params["since"] = String(since)
        }
        
        if let qs = params.queryString {
            url.append("?\(qs)")
        }
        
        return fetch(url, type: GetMarketTrades.self).then(decodeResult)
    }
    
    /**
     Returns a market’s order book.
     
     *Example:* <https://api.cryptowat.ch/markets/gdax/btcusd/orderbook>
     
     - Parameters:
        - exchange: A `String` symbolizing the exchange.
        - pair: A `String` representing the pair.
     
     - Returns: A `Promise` for a `GetMarketOrderBook` representing the response.
     */
    func getMarketOrderBook(exchange: String, pair: String) -> Promise<GetMarketOrderBook> {
        let url = "\(baseURL)/markets/\(exchange)/\(pair)/orderbook"
        return fetch(url, type: GetMarketOrderBook.self).then(decodeResult)
    }
    
    /**
     Fetches a market’s OHLC candlestick data. Returns data as lists of lists of numbers for each time period integer.
     
     *Example:*
     
     <https://api.cryptowat.ch/markets/gdax/btcusd/ohlc?before=1516497542&after=1516493942&periods=60>
     
     - Parameters:
        - exchange: A `String` symbolizing the exchange.
        - pair: A `String` representing the pair.
        - before: Only return candles opening before this UNIX timestamp.
        - after: Only return candles opening after this UNIX timestamp.
        - periods: Only return these time periods.
     
     - Returns: A `Promise` for a `GetMarketOHLC` representing the response.
     */
    func getMarketOHLC(exchange: String, pair: String, before: Int?, after: Int?, periods: [Int]?) -> Promise<GetMarketOHLC> {
        var url = "\(baseURL)/markets/\(exchange)/\(pair)/ohlc"
        var params: Dictionary<String, String> = [:]
        
        if let before = before {
            params["before"] = String(before)
        }
        
        if let after = after {
            params["after"] = String(after)
        }
        
        if let periods = periods {
            params["periods"] = periods.map({ period in
                return String(period)
            }).joined(separator: ",")
        }
        
        if let qs = params.queryString {
            url.append("?\(qs)")
        }
        
        return fetch(url, type: GetMarketOHLC.self).then(decodeResult)
    }
}
