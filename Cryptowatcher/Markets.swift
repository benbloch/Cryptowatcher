//
//  MarketSummary.swift
//  CryptoWatcher
//
//  Created by Ben on 1/14/18.
//

import Foundation
import then

/// A market is a `pair` listed on an `exchange`. For example, pair `btceur` on exchange `kraken` is a market.
struct Market: Codable {
    let exchange: String
    let pair: String
    let active: Bool
    let route: URL?
    let routes: Routes?
    
    /// A response structure representing all of the available routes for this `Market`.
    struct Routes: Codable {
        let price: URL
        let summary: URL
        let orderbook: URL
        let trades: URL
        let ohlc: URL
    }
}

/// Information about a price.
struct Price: Codable {
    let last: Double
    let high: Double
    let low: Double
    let change: Change
}

/// Details about a price change.
struct Change: Codable {
    let percentage: Double
    let absolute: Double
}

/// A summary containing `Price` and volume.
struct MarketSummary: Codable {
    let price: Price
    let volume: Double
}

/**
 A market's orderbook.
 
 Orders are lists of numbers in this order:
 
 `[ Price, Amount ]`
*/
struct OrderBook: Codable {
    let asks: [[Double]]
    let bids: [[Double]]
}

/// Represents a `getMarketIndex` response.
struct GetMarketIndex: Codable {
    let result: [Market]
    let allowance: Allowance
}

/// Represents a `getMarket` response.
struct GetMarket: Codable {
    let result: Market
    let allowance: Allowance
}

/// Represents a `getMarketPrice` response.
struct GetMarketPrice: Codable {
    let result: Price
    let allowance: Allowance
    
    /// A response structure representing the price.
    struct Price: Codable {
        let price: Double
    }
}

/// Represents a `getMarketSummary` response.
struct GetMarketSummary: Codable {
    let result: MarketSummary
    let allowance: Allowance
}

/**
 Represents a `getMarketTrades` response.
 
 Trades are lists of numbers in this order:
 
 `[ ID, Timestamp, Price, Amount ]`

 *Note: Some exchanges don’t provide IDs for public trades.*
*/
struct GetMarketTrades: Codable {
    let result: [[Double]]
    let allowance: Allowance
}

/// Represents a `getMarketOrderBook` response.
struct GetMarketOrderBook: Codable {
    let result: OrderBook
    let allowance: Allowance
}

/**
 Represents a `getMarketOHLC` response.
 
 The values are in this order:
 
 `[ CloseTime, OpenPrice, HighPrice, LowPrice, ClosePrice, Volume ]`
 
 *Note: At the time of writing, the API returns an additional unknown value.*
*/
struct GetMarketOHLC: Codable {
    let result: Dictionary<String, Array<Array<Double>>>
    let allowance: Allowance
}
