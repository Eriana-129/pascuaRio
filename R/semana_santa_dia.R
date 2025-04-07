#' Determina el día de la semana mayor, solo si la fecha pertenece a Semana Santa
#'
#' Esta función recibe un vector de fechas, determina si cada fecha cae dentro de los rangos de Semana Santa (Domingo de Ramos a Domingo de Resurrección) y edevuelve el día de la semana mayor a la que pertenece, ejemplo: "Viernes Santo". Si la fecha no pertenece a Semana Santa, el resultado es NA.
#'
#' @import data.table
#'
#' @importFrom utils globalVariables
#'
#' @param fechas Un vector de fechas en formato `Date` que se desea verificar.
#'
#' @return Un factor ordenado según la secuencia cronológica de la Semana Santa (de Domingo de Ramos a Domingo de Resurrección), no incluye los acentos, ya que el data frame original evita el uso de acentos al ser nombres de columnas, el usuario puede hacer los cambios de forma normal una vez teniendo el resultado.
#'
#' @examples
#' # El usuario debe tener su propio data frame `df` con una columna de fechas, en formato ymd.
#' #df$ss_dia <- semana_santa_dia(df$fecha_evento)
#'
#' @export
semana_santa_dia <- function(fechas) {
  fechas <- as.Date(fechas)

  # Preparar todos los días de Semana Santa para todos los años
  dias_semana_santa <- data.table::melt(
    pascuario,
    id.vars = "Year",
    measure.vars = names(pascuario)[-1],
    variable.name = "Dia",
    value.name = "Fecha"
  )

  # Convertir a Date si no lo está
  dias_semana_santa[, Fecha := as.Date(Fecha)]

  # Union
  resultado <- data.table(Fecha = fechas)
  resultado <- dias_semana_santa[resultado, on = .(Fecha), nomatch = NA]

  nombres_dias <- c(
    "Domingo de Ramos",
    "Lunes Santo",
    "Martes Santo",
    "Miercoles Santo",
    "Jueves Santo",
    "Viernes Santo",
    "Sabado de Gloria",
    "Domingo de resurreccion"
  )

  factor(resultado$Dia, levels = nombres_dias, ordered = TRUE)
}

utils::globalVariables(c(
  "pascuario", "Year", "Dia", "Fecha", "."
))
