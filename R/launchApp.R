#' launches the shinyAppDemo app
#'
#' @title Test
#' @description Bla
#' @details fdfd
#'
#' @export launchApp
#'
#' @return shiny application object
#'
#' @example \dontrun {launchApp()}
#'
#' @import shiny
#'
##

library(shiny)

# wrapper for shiny::shinyApp()
launchApp <- function() {
  shinyApp(ui = shinyAppUI, server = shinyAppServer)
}
