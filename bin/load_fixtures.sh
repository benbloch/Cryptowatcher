#!/bin/sh

FIXTURE_PATH="./CryptowatcherTests/Fixtures/"

# https://cryptowat.ch/docs/api
curl -sS "https://api.cryptowat.ch" > "$FIXTURE_PATH"getApiInfo.json

# https://cryptowat.ch/docs/api#assets-index
curl -sS "https://api.cryptowat.ch/assets" > "$FIXTURE_PATH"getAssetIndex.json

# https://cryptowat.ch/docs/api#asset
curl -sS "https://api.cryptowat.ch/assets/btc" > "$FIXTURE_PATH"getAsset.json

# https://cryptowat.ch/docs/api#pairs-index
curl -sS "https://api.cryptowat.ch/pairs" > "$FIXTURE_PATH"getPairIndex.json

# https://cryptowat.ch/docs/api#pair
curl -sS "https://api.cryptowat.ch/pairs/ethbtc" > "$FIXTURE_PATH"getPair.json

# https://cryptowat.ch/docs/api#exchanges-index
curl -sS "https://api.cryptowat.ch/exchanges" > "$FIXTURE_PATH"getExchangeIndex.json

# https://cryptowat.ch/docs/api#exchange
curl -sS "https://api.cryptowat.ch/exchanges/kraken" > "$FIXTURE_PATH"getExchange.json

# https://cryptowat.ch/docs/api#markets-index
curl -sS "https://api.cryptowat.ch/markets" > "$FIXTURE_PATH"getMarketIndex.json

# https://cryptowat.ch/docs/api#market
curl -sS "https://api.cryptowat.ch/markets/gdax/btcusd" > "$FIXTURE_PATH"getMarket.json

# https://cryptowat.ch/docs/api#price
curl -sS "https://api.cryptowat.ch/markets/gdax/btcusd/price" > "$FIXTURE_PATH"getMarketPrice.json

# https://cryptowat.ch/docs/api#summary
curl -sS "https://api.cryptowat.ch/markets/gdax/btcusd/summary" > "$FIXTURE_PATH"getMarketSummary.json

# https://cryptowat.ch/docs/api#trades
curl -sS "https://api.cryptowat.ch/markets/gdax/btcusd/trades?limit=100&since=1481663244" > "$FIXTURE_PATH"getMarketTrades.json

# https://cryptowat.ch/docs/api#orderbook
curl -sS "https://api.cryptowat.ch/markets/gdax/btcusd/orderbook" > "$FIXTURE_PATH"getMarketOrderBook.json

# https://cryptowat.ch/docs/api#ohlc
curl -sS "https://api.cryptowat.ch/markets/gdax/btcusd/ohlc?before=1516497542&after=1516493942&periods=60" > "$FIXTURE_PATH"getMarketOHLC.json

# https://api.cryptowat.ch/markets/prices
curl -sS "https://api.cryptowat.ch/markets/prices" > "$FIXTURE_PATH"getAggregatePrices.json

# https://cryptowat.ch/docs/api#summaries
curl -sS "https://api.cryptowat.ch/markets/summaries" > "$FIXTURE_PATH"getAggregateSummaries.json

