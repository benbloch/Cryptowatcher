//
//  Pairs.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation

/// A pair of assets. Each pair has a base and a quote. For example, `btceur` has base `btc` and quote `eur`.
struct Pair: Codable {
    let symbol: String
    let id: Int
    let base: Asset
    let quote: Asset
    let route: URL
    let markets: [Market]?
}

/// Represents a response from `getPairIndex`
struct GetPairIndex: Codable {
    let result: [Pair]
    let allowance: Allowance
}

/// Represents a response from 'getPair'
struct GetPair: Codable {
    let result: Pair
    let allowance: Allowance
}
