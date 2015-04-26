library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Your Body Mass Index Calculator"),
    
    sidebarPanel(
      numericInput(inputId="heightM", label="Your height in cm", value= 0,min=0),
      numericInput(inputId="weightM", label="Your weight in kg", value= 0,min=0),
      submitButton('Submit')
    ),
    
    mainPanel(
      h5("This is an application to help you calculate your Body Mass Index (BMI). BMI is an approximate measure of whether someone is over- or underweight, calculated by dividing their weight in kilograms by the square of their height in metres."),
      h5("In this application, you only need to key in your height and weight on the left side panel, and your BMI will be calculated below."),
      
      h3('Your BMI coefficient is...'),
      verbatimTextOutput("oiBMI"),
      h3('Your BMI class is...'),
      verbatimTextOutput("oiBMIclass")
      )
)
)