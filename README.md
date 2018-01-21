# Cryptowatcher
An API client for Cryptowatch written in swift. 

Cryptowatcher uses the `Codable` protocol introduced in Swift 4 to decode JSON data from the [Cryptowatch API](https://cryptowat.ch/docs/api).
All network calls are made wtih `URLSession` and provide a promise-based interface through [then](https://github.com/freshOS/then).

## Example
Each of the get functions for `Cryptowatcher` will return a `Promise` for a corresponding struct representing the response. In the example below, `getMarketPrice` returns `Promise<GetMarketPrice>`.
```swift
Cryptowatcher().getMarketPrice(exchange: "gdax", pair: "btcusd").then { response in
  let price = response.result.price
  let remainingAllowance = response.allowance.remaining
  // Use the values to do something fun
}.onError { error in
  // Handle the error
}
```

## Carthage
This project currently uses [Carthage](https://github.com/Carthage/Carthage/) to manage it's dependency on [then](https://github.com/freshOS/then).

## Testing
Decoding is fully tested through fixtures generated using a simple script located at `bin/load_fixtures.sh`. These fixtures are committed but may be refreshed to test against newer data.

To generate new fixtures:
1. Make the script executable (only once):
`chmod u+x ./bin/load_fixtures.sh`
2. Run the script
`./bin/load_fixtures.sh`

## Documentation
Code is fully documented and provides helpful hints such as an example URL, notes about API constraints and expected data formats. Documentation for the Cryptowatch API can be found at https://cryptowat.ch/docs/api. 

## Future
This is a very early version providing basic fetch functionality. The following are considerations for future versions:
- Pick a mocking approach and implement tests for all of the network calls.
- Remove `then` in favor of a baked-in promise solution or adopt a less attractive interface.
- Facilitate polling with respect paid to the CPU allowance.
- Add CocoaPods support
