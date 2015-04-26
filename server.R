library(shiny)

BMI <- function(weightM,heightM) {
  if (weightM==0 | heightM==0) return(NA) 
  else  return(round(weightM/(heightM/100)^2,1))
}

classBMI<-function(bmic) {
  if (is.na(bmic)) return ("")
  else {
    if (bmic<18.5) return("Your BMI is less than 18.5. You are considered UNDERWEIGHT") 
    if (bmic>=8.5 & bmic<24.9) return("Your BMI is in range 18.5 to 24.9. You are in HEALTHY WEIGHT RANGE")
    if (bmic>=25 & bmic<29.9) return("Your BMI is in range 25 to 29.9. You are OVERWEIGHT")
    if (bmic>=30) return("Your BMI is higher than 30. You are OBESE")
  }
}

shinyServer(
  function(input, output) {
    
    output$oiweight <- renderPrint({input$weightM})
    
    output$oiheight <- renderPrint({input$heightM})
    
    output$oiBMI <- renderPrint({BMI(input$weightM,input$heightM)})
    
    output$oiBMIclass <- renderText({classBMI(BMI(input$weightM,input$heightM))})
    
    }
  )                