//
//  CryptowatcherTests+Helpers.swift
//  CryptowatcherTests
//
//  Created by Ben on 1/21/18.
//  Copyright © 2018 Ben. All rights reserved.
//

import XCTest
import then

/// A protocol that is extended to provide test helpers.
protocol Helpable { }

extension Bundle {
    /// Used only to retreive a test `Bundle`.
    private class MyTestCase: XCTestCase { }
    
    /// Returns a test `Bundle`.
    static var testBundle: Bundle {
        return Bundle(for: MyTestCase.self)
    }
}

extension Helpable {
    /**
     Decodes the JSON fixture as the specified type.
     
     - Parameters:
        - decodeType: Decode the fixture to this type.
        - name: The name of the fixture file (without an extension)
     
     - Returns: A `Promise` for the fixture decoded as the specified type.
     */
    func decodeFixture<T: Decodable>(decodeType: T.Type, name: String) -> Promise<T> {
        
        return Promise { resolve, reject in
            let url = Bundle.testBundle.url(forResource: name, withExtension: "json")
            do {
                let data = try Data(contentsOf: url!, options: Data.ReadingOptions.alwaysMapped)
                let fetchResult = FetchResult(data: data, type: decodeType)
                Cryptowatcher().decodeResult(result: fetchResult).then { response in
                    XCTAssertNotNil(response)
                    resolve(response)
                    }.onError({ error in
                        XCTFail(error.localizedDescription)
                        reject(error)
                    })
            } catch let error {
                XCTFail(error.localizedDescription)
                reject(error)
            }
        }
    }
}
