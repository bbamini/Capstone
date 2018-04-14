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
shinyServer(function(input, output) {
  
  dbase <- readRDS("C:/Users/bamini/Documents/Coursera/Capstone/final/en_US/Rev/dbasesmall.rds")
  
  nextword <- function(phrase) {
    newphrase <- gsub("\\s+", " ", str_trim(gsub("(?!')[[:punct:]]", "", phrase, perl = TRUE)))
    newphrase <- tolower(newphrase)
    
    last3words <- word(newphrase, -3, -1)
    last2words <- word(newphrase, -2, -1)
    lastword <- word(newphrase, -1)
    
    if (!!length(dbase[base == last3words, predicted])) {
      nextwd <- dbase[base == last3words, predicted]
      return(nextwd)
    } else if (!!length(dbase[base == last2words, predicted])) {
      nextwd <- dbase[base == last2words, predicted]
      return(nextwd)
    } else if (!!length(dbase[base == lastword, predicted])) {
      nextwd <- dbase[base == lastword, predicted]
      return(nextwd)
    } else if (!length(dbase[base == lastword, predicted])) {
      print("No Suggestions")
    }
  }
  
  wordpred <- reactive({
    textinp <- input$text1
    nextword(textinp)
  })
  
  output$textpred <- renderText({wordpred()})
  
   
  
})
