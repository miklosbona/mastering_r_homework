#' Query historical exchange rate for any currency
#' @param symbol string
#' @param base string
#' @param days number
#' @return string
#' @export
#' @importFrom httr GET data.table DATA.TABLE
#' @examples
#' convert_currency('EUR', 'USD', 30)

convert_currency <- function(symbols, base, days) {
  response <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = Sys.Date() - days,
      end_at   = Sys.Date(),
      base     = base,
      symbols  = symbols
    ))
  exchange_rates <- content(response)
  exchange_rates <- exchange_rates$rates
  DT <- data.table(
    date = as.Date(names(exchange_rates)),
    rate = as.numeric(unlist(exchange_rates)))
  DT[order(rank(date), rate)]
}

