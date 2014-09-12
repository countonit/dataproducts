library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Miles Per Gallon"),
  
  # Sidebar with controls to select the inputs into the model
  sidebarPanel(
    selectInput("cylinders", "Cylinders:",
                list("4" = "4", 
                     "6" = "6", 
                     "8" = "8")
                ),
    sliderInput("weight", "Vehicle Weight:",
                min=500, max=4000, value=1000, step=100),
    selectInput("autoTransmission", "Automatic Transmission", 
                list("Automatic"= "Automatic",
                     "Manual"="Manual"))
  ),
  
  #Main Panel to show the results of the prediction
  mainPanel(
    h3('Results of Prediction:'),
    verbatimTextOutput("prediction")
  )
))
