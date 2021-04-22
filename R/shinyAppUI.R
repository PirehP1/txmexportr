#' Shiny app server object
#' @title Test
#' @import shiny shinybusy
#' @details fdfd
#' @description  fdjjfdk
##


library(shiny)
library(shinybusy)


# Define UI for application that draws a histogram
shinyAppUI <- fluidPage(
    #
    add_busy_spinner(spin = "fading-circle"),
    tags$style(type='text/css',
    '#showUnitesLexicales {width: 800px; height: 420px;
    background-color : #f5f5f5}'),
    #tags$style(type='text/css',
    #'#showUnitesLexicales {white-space: pre-wrap; max-height: 400px;}'),

    # Application title
    titlePanel("Exporter les unités lexicales d'un corpus TXM"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            #
            fileInput("xmlfile", "Choisissez le fichier XML",
                      multiple = FALSE,
                      accept = c("text/xml")),

            # Horizontal line ----
            tags$hr(),

            # Menu déroulant pour sélectionner l'unité lexicale à exporter
            selectInput(inputId = "uniLexicale",
                        label = "Sélectionnez une unité lexicale :",
                        choice = "Choisissez d'abord un fichier XML."
            ),
            # Horizontal line ----
            tags$hr(),
            # Bouton pour télécharger les résultats
            downloadButton("downloadData", "Enregistrer")
        ),
        # Affichage des unités lexicales sélectionnées dans la zone principale
        mainPanel(
            # textOutput("showUnitesLexicales")
            h2("Comment utiliser TXMexporteR ?"),
            tags$ol(
                tags$li("Sélectionnez le fichier XML généré par TXM dans le menu à gauche. Pour trouver le ficher XML en question :"),
                tags$ol(
                    tags$li("Ouvrez le dossier TXM sur votre ordinateur"),
                    tags$li("Ouvrez ensuite le dossier correspondant à votre corpus"),
                    tags$li("Dans celui-ci il faut ouvrir le dossier txm, puis celui correspondant à nouveau au nom du corpus"),
                    tags$li("Vous devriez alors y trouver le fichier XML en question.")
                ),
                tags$li("Choisissez l'unité lexicale à exporter dans le menu déroulant"),
                tags$li("Les unités lexicales s'affichent alors ci-dessous. Il est également possible de les télécharger dans un fichier texte via le bouton idoine à gauche.")
            ),
            h2("Unités lexicales exportées"),
            textOutput("showUnitesLexicales", tags$textarea)
            # verbatimTextOutput("showUnitesLexicales")
        )
    )
)
