//
//  Exchanges.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation

/// Exchanges are where all the action happens!
struct Exchange: Codable {
    let symbol: String
    let name: String
    let active: Bool
    let route: URL?
    let routes: Routes?
    
    /// A response structure containing a `markets` route for retreiving the markets for this exchange.
    struct Routes: Codable {
        let markets: URL
    }
}

/// Represents a response from `getExchangeIndex`.
struct GetExchangeIndex: Codable {
    let result: [Exchange]
    let allowance: Allowance
}

/// Represents a response from `getExchange`.
struct GetExchange: Codable {
    let result: Exchange
    let allowance: Allowance
}

extension Exchange {
    /// Symbols for each exchange at the time of writing.
    /// See `getExchangeIndex` to retreive information about current exchanges.
    enum Symbol: String {
        case Bitfinex = "bitfinex"
        case BitFlyer = "bitflyer"
        case Bithumb = "bithumb"
        case BitMEX = "bitmex"
        case Bitstamp = "bitstamp"
        case Bitsquare = "bitsquare"
        case Bittrex = "bittrex"
        case BitVC = "bitvc"
        case BTCChina = "btc-china"
        case BTCe = "btce"
        case CEXIO = "cexio"
        case Cryptsy = "cryptsy"
        case GDAX = "gdax"
        case Gemini = "gemini"
        case Huobi = "huobi"
        case Kraken = "kraken"
        case Luno = "luno"
        case meXBT = "mexbt"
        case MtGox = "mtgox"
        case OKCoin = "okcoin"
        case Poloniex = "Poloniex"
        case Qryptos = "qryptos"
        case QuadrigaCX = "quadriga"
        case Quoine = "quoine"
        case SevenNineSix = "796"
        case VaultofSatoshi = "vault-of-satoshi"
    }
}
