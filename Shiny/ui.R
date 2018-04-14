#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  verticalLayout(
    
    # Application title
    titlePanel("Predict the Next Word"),
    
    
    # Text Input
    textInput("text1", label = h3("Text input"), value = "Enter text..."),
    submitButton("Submit"),
    
    
    wellPanel(
      h3("Possible next words"),
      textOutput("textpred")
    )
  )
  
))
