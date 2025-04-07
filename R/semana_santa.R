#' Determina si una fecha pertenece a la Semana Santa
#'
#' Esta función recibe un vector de fechas y determina si cada fecha cae dentro de los rangos de Semana Santa (Domingo de Ramos a Domingo de Resurrección) indicando TRUE si la fecha pertenece a la Semana Santa y FALSE si no.
#'
#' @import data.table
#'
#' @importFrom utils globalVariables
#'
#' @param fechas Un vector de fechas en formato `Date` que se desea verificar.
#'
#' @return Un vector lógico de la misma longitud que `fechas`, donde si la fecha corresponde a la Semana Santa es `TRUE` y `FALSE` si no.
#'
#' @examples
#' # El usuario debe tener su propio data frame `df` con una columna de fechas, en formato ymd.
#' #df$ss <- semana_santa(df$fecha_evento)
#'
#' @export
semana_santa <- function(fechas) {
  fechas <- as.Date(fechas)

  rangos <- get("pascuario")[, list(
    inicio = get("Domingo de Ramos"),
    fin = get("Domingo de resurreccion"),
    Year = get("Year")
  )]

  # Convertir fechas a data.table para facilitar la unión
  dt_fechas <- data.table(fecha = fechas, original_order = seq_along(fechas))

  # Realizar la unión para identificar coincidencias entre la fecha y los intervalos de inicio y fin
  resultado <- rangos[dt_fechas, on = .(inicio <= fecha, fin >= fecha)]

  # Lógica True/False
  res <- !is.na(resultado$Year)
}

# Declarar variables globales para evitar NOTEs
utils::globalVariables(c(
  "pascuario", "Domingo de Ramos", "Domingo de resurreccion", "Year",
  "inicio", "fin", "fecha", "."
))
