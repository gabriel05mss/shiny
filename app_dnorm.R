library(shiny)
ui <-fluidPage(
  sliderInput(inputId = "amostra",
              label ="escolha um tamanho de amostra",
              value = 50, min = 50, max = 1000,step = 50
              
  ),
  sliderInput(inputId = "media",
              label ="escolha uma media",
              value = 0, min = 0, max = 10
              
  ),
  sliderInput(inputId = "sd",
              label ="escolha um desvio padrão",
              value = 0, min = 1, max =5
              
  ),
  plotOutput("plot")
)

server <-function(input,output,session){
  output$plot <- renderPlot({
    amostra <- seq(-50,50,length.out = input$amostra)
    mean <- input$media
    sd <- input$sd
    densidade <-dnorm(amostra, mean = mean, sd =sd)
    titulo <- "normal"
    plot(amostra,densidade,type = "l", lwd = 3)
  })
  
}

shinyApp(ui = ui,server = server)