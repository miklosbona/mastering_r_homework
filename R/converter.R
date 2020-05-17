#' Hitting Binance API to get bitcoin price in USD
#' @export
#' @param retried the no. of retries previously
#' @importFrom binancer binanc_coins_prices
get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e) {
      Sys.sleep(1 + retried^2) # exponential backoff retries
      get_bitcoin_price(retried + 1)
    })
}

#' Making the dollar sign for the forint currency
#' @export
#' @importFrom scales dollar
forint <- function(x) {
  dollar(x, prefix = '', suffix = 'Ft')
}
