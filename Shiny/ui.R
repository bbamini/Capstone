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
    
    h3("Instructions"),
    

    # Text Input
    textInput("text1", label = h3("Text input"), value = "Enter text..."),
    actionButton("predict", label = "Predict"),
    
    
    wellPanel(
      h3("Possible next words"),
      textOutput("textpred")
    ),
    
    actionButton("action", label = "Select"),
    p("Click the button to update the text with the predicted next word.")
  )
  
))
