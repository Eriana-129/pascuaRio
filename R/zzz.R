.onLoad <- function(libname, pkgname) {
  # Carga silenciosa del dataset
  utils::data("pascuario", package = pkgname,
              envir = parent.env(environment()))
}
