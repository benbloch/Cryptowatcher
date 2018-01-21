//
//  Fetchable.swift
//  CryptoWatcher
//
//  Created by Ben on 1/15/18.
//

import Foundation
import then

/// A protocol which is extended to add fetching and decoding capabilities.
protocol Fetchable {}

/// Represents errors that can occur while fetching.
enum FetchableError: Swift.Error {
    /// The `URL` could not be parsed from a string
    case malformedURL
}

/// Allows us to utilize the specified `Decodable` `type` in `Promises` along with the response `data`.
struct FetchResult<T: Decodable> {
    let data: Data?
    let type: T.Type
}

extension Fetchable {
    /**
     Peforms a network request to fetch data.
     
     - Parameters:
        - url: The `URL` from which to fetch data.
        - type: The `Decodable` type to pass along.
     
     - Returns: A `Promise` for a `FetchResult<T>`.
     */
    func fetch<T: Decodable>(_ url: URL, type: T.Type) -> Promise<FetchResult<T>> {
        return Promise { resolve, reject in
            
            let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                
                if let error = error {
                    reject(error)
                    return
                }
                
                let result = FetchResult(data: data, type: type)
                
                resolve(result)
            })
            
            dataTask.resume()
        }
    }
    
    /**
     Peforms a network request to fetch data.
     
     - Parameters:
     - url: The `string` representing the `URL` from which to fetch data.
     - type: The `Decodable` type to pass along.
     
     - Returns: A `Promise` for a `FetchResult<T>`.
     */
    func fetch<T: Decodable>(_ url: String, type: T.Type) -> Promise<FetchResult<T>> {
        guard let url = URL(string: url) else {
            return Promise.reject(FetchableError.malformedURL)
        }
        return fetch(url, type: type)
    }
    
    /**
     Decodes JSON data as the specified `Decodable` type in the result.
     
     This function can be chained onto a `fetch` call like so:
     
     `fetch(myURL, MyType.self).then(decodeResult)`
     
     - Parameter result: Contains the data and the type for which the data will be decoded.
     - Returns: A `Promise` for JSON data decoded as the specified type.
     */
    func decodeResult<T>(result: FetchResult<T>) -> Promise<T> {
        return Promise { resolve, reject in
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(result.type, from: result.data ?? Data())
                resolve(result)
            } catch let error {
                reject(error)
            }
        }
    }
}
