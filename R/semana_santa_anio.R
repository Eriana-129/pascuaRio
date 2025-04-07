#' Determina si una fecha pertenece a Semana Santa y su año
#'
#' Esta función recibe un vector de fechas y determina si cada fecha cae dentro de los rangos de Semana Santa (Domingo de Ramos a Domingo de Resurrección) y el año al que pertenece de Semana Santa, ejemplo: Semana Santa (2019), si no pertenece a Semana Santa de ningun año, indica FALSE.
#'
#' @import data.table
#'
#' @importFrom utils globalVariables
#'
#' @param fechas Un vector de fechas en formato `Date` que se desea verificar.
#'
#' @return Un vector de caracteres con dos tipos posibles de valores, ya sea FALSE, o bien, el texto "Semana Santa (AÑO)".
#'
#' @examples
#' # El usuario debe tener su propio data frame `df` con una columna de fechas, en formato ymd.
#' #df$ss_anio <- semana_santa_anio(df$fecha_evento)
#'
#' @export
semana_santa_anio <- function(fechas) {
  fechas <- as.Date(fechas)

  # Preparar tabla de rangos
  rangos <- get("pascuario")[, list(
    inicio = get("Domingo de Ramos"),
    fin = get("Domingo de resurreccion"),
    Year = get("Year")
  )]

  # Convertir fechas a data.table para merge
  dt_fechas <- data.table(fecha = fechas, original_order = seq_along(fechas))

  # Join para encontrar coincidencias (fecha BETWEEN inicio AND fin)
  resultado <- rangos[dt_fechas, on = .(inicio <= fecha, fin >= fecha)]

  # Ordenar y generar etiquetas
  setorder(resultado, original_order)
  ifelse(is.na(resultado$Year), "FALSE", paste("Semana Santa", resultado$Year))
}

# Declarar variables globales para evitar NOTEs
utils::globalVariables(c(
  "pascuario", "Domingo de Ramos", "Domingo de resurreccion", "Year",
  "inicio", "fin", "fecha", ".", "original_order"
))
