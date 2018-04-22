#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(stringi)
library(stringr)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  dbase <- readRDS("C:/Users/bamini/Documents/Coursera/Capstone/final/en_US/Rev/dbasesmall.rds")
  

  nextword <- function(phrase) {
    newphrase <- gsub("\\s+", " ", str_trim(gsub("(?!')[[:punct:]]", "", phrase, perl = TRUE)))
    newphrase <- tolower(newphrase)
    last3words <- word(newphrase, -3, -1)
    last2words <- word(newphrase, -2, -1)
    lastword <- word(newphrase, -1)

    tetraword <- dbase[base == last3words, predicted]
    triword <- dbase[base == last2words, predicted]
    biword <- dbase[base == lastword, predicted]

    nextwds <- unique(c(biword, triword, tetraword))
    return(nextwds)
  }
  
  
  
  observeEvent(input$predict, {
    if (!is.na(nextword(input$text1)[1])) {
      output$textpred1 <- renderText(isolate(nextword(input$text1)[1]))
    } else { output$textpred1 <- renderText("")}
    
    if (!is.na(nextword(input$text1)[2])) {
      output$textpred2 <- renderText(isolate(nextword(input$text1)[2]))
    } else { output$textpred2 <- renderText("")}
    
    if (!is.na(nextword(input$text1)[3])) {
      output$textpred3 <- renderText(isolate(nextword(input$text1)[3]))
    } else { output$textpred3 <- renderText("")}
  })
  
  observeEvent(input$select1, {
    if (!is.na(nextword(input$text1)[1])) {
      newprediction1 <- nextword(input$text1)[1]  
    } else { newprediction1 <- ""}
    updateTextInput(session, "text1", value = paste(input$text1, newprediction1))
  })
  
  
  observeEvent(input$select2, {
    if (!is.na(nextword(input$text1)[2])) {
      newprediction2 <- nextword(input$text1)[2]  
    } else { newprediction2 <- ""}
    updateTextInput(session, "text1", value = paste(input$text1, newprediction2))
  })
  
  observeEvent(input$select3, {
    if (!is.na(nextword(input$text1)[3])) {
      newprediction3 <- nextword(input$text1)[3]  
    } else { newprediction3 <- ""}
    updateTextInput(session, "text1", value = paste(input$text1, newprediction3))
  })

  
})
