//
//  CryptoWatcherTests.swift
//  CryptoWatcherTests
//
//  Created by Ben on 1/13/18.
//

import XCTest
@testable import Cryptowatcher
import then

class CryptowatcherTests: XCTestCase, Helpable {
    
    let timeout = 10.0
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDecodeGetApiInfo() {
        decodeFixture(decodeType: GetApiInfo.self, name: "getApiInfo").then { response in
            XCTAssertGreaterThan(response.result.indexes.count, 0)
        }
    }
    
    func testDecodeGetAssetIndex() {
        decodeFixture(decodeType: GetAssetIndex.self, name: "getAssetIndex").then { response in
            XCTAssertGreaterThan(response.result.count, 0)
            XCTAssertNotNil(response.result.first!.route)
        }
    }
    
    func testDecodeGetAsset() {
        decodeFixture(decodeType: GetAsset.self, name: "getAsset").then { response in
            XCTAssertNotNil(response.result.markets)
            XCTAssertGreaterThan(response.result.markets!.base.count, 0)
            XCTAssertGreaterThan(response.result.markets!.quote.count, 0)
        }
    }
    
    func testDecodeGetPairIndex() {
        decodeFixture(decodeType: GetPairIndex.self, name: "getPairIndex").then { response in
            XCTAssertGreaterThan(response.result.count, 0)
        }
    }
    
    func testDecodeGetPair() {
        decodeFixture(decodeType: GetPair.self, name: "getPair").then { response in
            XCTAssertNotNil(response.result.markets)
            XCTAssertGreaterThan(response.result.markets!.count, 0)
        }
    }
    
    func testDecodeGetExchangeIndex() {
        decodeFixture(decodeType: GetExchangeIndex.self, name: "getExchangeIndex").then { response in
            XCTAssertGreaterThan(response.result.count, 0)
            XCTAssertNotNil(response.result.first!.route)
        }
    }
    
    func testDecodeGetExchange() {
        decodeFixture(decodeType: GetExchange.self, name: "getExchange").then { response in
            // A "routes" key is returned here, where it is not present in GetExchangeIndex
            XCTAssertNotNil(response.result.routes)
        }
    }
    
    func testDecodeGetMarketIndex() {
        decodeFixture(decodeType: GetMarketIndex.self, name: "getMarketIndex").then { response in
            XCTAssertGreaterThan(response.result.count, 0)
            XCTAssertNotNil(response.result.first!.route)
        }
    }
    
    func testDecodeGetMarket() {
        decodeFixture(decodeType: GetMarket.self, name: "getMarket").then { response in
            // A "routes" key is returned here, where it is not present in GetMarketIndex
            XCTAssertNotNil(response.result.routes)
        }
    }
    
    func testDecodeGetMarketPrice() {
        decodeFixture(decodeType: GetMarketPrice.self, name: "getMarketPrice").then { response in
            XCTAssertGreaterThan(response.result.price, 0)
        }
    }
    
    func testDecodeGetMarketSummary() {
        decodeFixture(decodeType: GetMarketSummary.self, name: "getMarketSummary").then { response in
            // Add more tests here when relevant
        }
    }
    
    func testDecodeGetTrades() {
        decodeFixture(decodeType: GetMarketTrades.self, name: "getMarketTrades").then { response in
            XCTAssertGreaterThan(response.result.count, 0)
            XCTAssertEqual(response.result.first!.count, 4)
        }
    }
    
    func testDecodeGetMarketOrderBook() {
        decodeFixture(decodeType: GetMarketOrderBook.self, name: "getMarketOrderBook").then { response in
            XCTAssertGreaterThan(response.result.asks.count, 0)
            XCTAssertGreaterThan(response.result.bids.count, 0)
            XCTAssertEqual(response.result.asks.first!.count, 2)
            XCTAssertEqual(response.result.bids.first!.count, 2)
        }
    }
    
    func testDecodeGetMarketOHLC() {
        decodeFixture(decodeType: GetMarketOHLC.self, name: "getMarketOHLC").then { response in
            XCTAssertGreaterThan(response.result.keys.count, 0)
            XCTAssertGreaterThan(response.result.first!.value.count, 0)
            XCTAssertEqual(response.result.first!.value.first!.count, 7) // Note: API docs say 6
        }
    }
    
    func testDecodeGetAggregatePrices() {
        decodeFixture(decodeType: GetAggregatePrices.self, name: "getAggregatePrices").then { response in
            XCTAssertGreaterThan(response.result.keys.count, 0)
        }
    }
    
    func testDecodeGetAggregateSummaries() {
        decodeFixture(decodeType: GetAggregateSummaries.self, name: "getAggregateSummaries").then { response in
            XCTAssertGreaterThan(response.result.keys.count, 0)
        }
    }
}
