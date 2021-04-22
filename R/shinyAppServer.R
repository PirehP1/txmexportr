#' Shiny app server function
#'
#' @title Test
#' @description Blou
#' @details fdfd
#' @param input provided by shiny
#' @param output provided by shiny
#' @import xml2
##


# library(shiny)
library(xml2)

# Define server logic required to draw a histogram
shinyAppServer <- function(input, output, session) {

    observeEvent(input$xmlfile, {
        req(input$xmlfile)
        x <- read_xml(input$xmlfile$datapath)
        # On cherche un noeud <w>
        mot <- xml_find_first(x, ".//tei:w")
        # On récupère les différentes valeurs possibles pour l'attribut #type
        # de ce noeud <w>
        annotations <-xml_attr(xml_children(mot), "type")
        # On y ajoute manuellement un élément pour les formes graphiques
        type_annotations <- append(annotations, "w (formes graphiques)")
        # On efface des éléments venants du balisage TXM inutiles ici
        print(type_annotations)
        print("=================")
        # type_annotations2 <-type_annotations[type_annotations %in% c("#n") == FALSE]
        #
        updateSelectInput(session, "uniLexicale", choices = type_annotations)
    })

    unitesLexicales <- reactive({
        req(input$xmlfile)
        x <- read_xml(input$xmlfile$datapath)

        # if (is.na(input$uniLexicale) == TRUE){
        if (input$uniLexicale == "Choisissez d'abord un fichier XML."){
            print("OK ?")
            results <- ("Sélectionnez une unité lexicale valide.")
        }
        else if(input$uniLexicale == "w (formes graphiques)"){
            req(input$xmlfile)
            x <- read_xml(input$xmlfile$datapath)
            fg <- xml_find_all(x, ".//txm:form")
            results <- xml_text(fg)
        }
        # else if(input$uniLexicale != "#n" || is.na(input$uniLexicale) != TRUE){
        else {
            path = ".//txm:ana[@type='"
            attr = paste(input$uniLexicale, "']", sep="")
            print(input$uniLexicale)
            xpath = paste(path, attr, sep="")
            print(xpath)
            unilex <- xml_find_all(x, xpath)
            results <- xml_text(unilex)
        }
        return(results)
    })

    output$showUnitesLexicales <- renderText({
        unitesLexicales()
    })

    output$downloadData <- downloadHandler(
        filename = function(){
            paste(input$uniLexicale, ".txt", sep="")
            },
        content = function(file){
            writeLines(unitesLexicales(), file)
        }
    )
}
