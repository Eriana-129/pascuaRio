#' Fechas de la Semana Santa desde 1997 al 2050
#'
#' Este conjunto de datos contiene las fechas de la semana mayor, desde Domingo de Ramos a Domingo de Resurrección, de acuerdo con los años antes mencionados. Los datos se almacenan en un objeto data.table"
#'
#' @docType data
#'
#' @usage data(pascuario)
#'
#' @format Un data.table con las siguientes columnas:
#' \describe{
#'   \item{Year}{Año de la Semana Santa.}
#'   \item{Domingo de Ramos}{Fecha del Domingo de Ramos.}
#'   \item{Lunes Santo}{Fecha del Lunes Santo.}
#'   \item{Martes Santo}{Fecha del Martes Santo.}
#'   \item{Miercoles Santo}{Fecha del Miércoles Santo.}
#'   \item{Jueves Santo}{Fecha del Jueves Santo.}
#'   \item{Viernes Santo}{Fecha del Viernes Santo.}
#'   \item{Sabado de Gloria}{Fecha del Sábado de Gloria.}
#'   \item{Domingo de resurreccion}{Fecha del Domingo de Resurrección.}
#' }
#'
#' @source A partir de consultas de páginas web relacionadas con la religión católica
#'
#' @examples
#' data(pascuario)
#' head(pascuario)
#'
#' @keywords datasets fechas SemanaSanta religion
"pascuario"
