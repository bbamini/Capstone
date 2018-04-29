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
  
  span(headerPanel("Data Science Specialization - Next Word Prediction"), style = "color:navy"),

  
  sidebarLayout(

    
    sidebarPanel(
      
      h3("Instructions"),
      
      tags$head(
        tags$style(HTML("
                        li {
                        color: navy;
                        font-size: 18px;
                        
                        }
                        
                        "))
        ),
      
      tags$ol(
        tags$li("Type a phrase into the Text Input box"),
        tags$li("Click the Predict button to get up to 3 possible next words predictions including the backoff model prediction."),
        tags$li("If a prediction matches your choice, click the appropriate Select button to extend your phrase with the prediction."),
        tags$style()
      ),
      
      # Text Input
      textInput("text1", label = h3("Text input"), value = ""),
      actionButton("predict", label = "Predict"),
      br(),
      br(), 
      img(src = "logo.png", height = 250, width = 250, align = "middle")
      
    ),
    
    
    
    mainPanel(
      h3("Prediction from backoff model:"),
      
      textOutput("backoffpred"),
      tags$head(tags$style("#backoffpred{color: teal;
                                 font-size: 20px;
                           }"
      )
      ),
      br(),
      br(),
      
      h3("All possible predictions:"),
      textOutput("textpred1"),
      tags$head(tags$style("#textpred1{color: green;
                                 font-size: 20px;
                                 }"
      )
      ),
      actionButton("select1", label = "Select"),
      br(),
      br(),
      textOutput("textpred2"),
      tags$head(tags$style("#textpred2{color: green;
                                 font-size: 20px;
                           }"
      )
      ),
      actionButton("select2", label = "Select"),
      br(),
      br(),
      textOutput("textpred3"),
      tags$head(tags$style("#textpred3{color: green;
                                 font-size: 20px;
                           }"
      )
      ),
      actionButton("select3", label = "Select"),
      br(),
      br(),
      
      p("Click the Select button to update the text with the corresponding predicted word.")
      
    )
    
    
  ), position = "right"
  
))
