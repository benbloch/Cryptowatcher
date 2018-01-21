//
//  CryptoWatchApi+Assets.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation
import then

extension Cryptowatcher {
    /**
     Fetches all assets (in no particular order).
     
     *Example:* <https://api.cryptowat.ch/assets>
     
     - Returns: A `Promise` for a `GetAssetIndex` representing the response.
     */
    func getAssetIndex() -> Promise<GetAssetIndex> {
        let url = "\(baseURL)/assets"
        return fetch(url, type: GetAssetIndex.self).then(decodeResult)
    }
    
    /**
     Fetches a single asset. Lists all `Markets` which have this asset as a base or quote.
     
     *Example:* <https://api.cryptowat.ch/assets/btc>
     
     - Parameter asset: A `String` representing an `Asset`.
     - Returns: A `Promise` for a `GetAsset` representing the response.
     */
    func getAsset(asset: String) -> Promise<GetAsset> {
        let url = "\(baseURL)/assets/\(asset)"
        return fetch(url, type: GetAsset.self).then(decodeResult)
    }
}
