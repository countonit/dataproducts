library(shiny)
library(datasets)

# We tweak the "am" field to have nicer factor labels and change the cyl variable to be a factor
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))
mpgData$cyl<- as.factor(mpgData$cyl)

#create prediction algorithm
fit=lm(mpg~wt+am+cyl, data=mpgData)

#create the prediction based on the user inputs
pred=function(weight, autoTransmission, cylinders) predict(fit,data.frame(wt=(weight/1000), am=autoTransmission, cyl=cylinders))

#Create the shiny function
shinyServer(function(input, output) {
  
output$prediction = renderPrint({pred(input$weight, input$autoTransmission, input$cylinders)})
})
