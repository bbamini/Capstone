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
    titlePanel("Word Prediction"),
    
    h3("Instructions"),
    
    tags$ol(
      tags$li("Type a phrase into the Text Input box"),
      tags$li("Click the Predict button to get up to 3 possible next words."),
      tags$li("If a prediction matches your choice, click the appropriate Select button to extend your phrase with the prediction.")  
    ),
    

    # Text Input
    textInput("text1", label = h3("Text input"), value = ""),
    actionButton("predict", label = "Predict"),
    br(),
    
    
    wellPanel(
      h4("Possible next word:"),
      textOutput("textpred1"),
      actionButton("select1", label = "Select"),
      br(),
      textOutput("textpred2"),
      actionButton("select2", label = "Select"),
      br(),
      textOutput("textpred3"),
      actionButton("select3", label = "Select"),
      br(),
      
      p("Click the button to update the text with the predicted next word.")
      
    )
    
    
  )
  
))
