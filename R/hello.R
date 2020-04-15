#' Function to get current bitcoin price from binancer
#' @export
get_bitcoin_price <- function(retried = 0) {
  tryCatch(
    binance_coins_prices()[symbol == 'BTC', usd],
    error = function(e) {
      ## exponential backoff retries
      Sys.sleep(1 + retried^2) # putting the r session to sleep
      get_bitcoin_price(retried = retried +1)
    })
}

#' Function to format value to Forint currency
#' @export
forint <- function(x) {
  dollar(x, prefix = '', suffix = 'Ft')
}
