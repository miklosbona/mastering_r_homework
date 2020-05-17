#' Formats Hungarian Forint
#' @param x number
#' @return string
#' @export
#' @importFrom scales dollar
#' @examples
#' forint(100000)
#' forint(10.3241245125125)
forint <- function(x) {
  dollar(x, prefix = '', suffix = ' HUF')
}
