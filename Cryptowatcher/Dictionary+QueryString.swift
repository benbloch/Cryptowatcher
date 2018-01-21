//
//  Dictionary+QueryString.swift
//  CryptoWatcher
//
//  Created by Ben on 1/20/18.
//

import Foundation

extension Dictionary {
    /// Turns a `Dictionary` of parameters into a `querystring`.
    var queryString: String? {
        let qs = self.map({ key, value in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        return qs.isEmpty ? nil : qs
    }
}
