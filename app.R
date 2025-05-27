ui8 <- fluidPage(
  
  sidebarLayout(
    sidebarPanel(
           sliderInput(inputId = "startyear",
                        label = "Select start year:",
                        min = 1880,
                        max = 2017,
                        value = 1880),
   
           sliderInput(inputId = "endyear",
                        label = "Select end year:",
                        min = 1880,
                        max = 2017,
                        value = 2017),
    
           checkboxGroupInput(inputId = "names",
                              label = "Select name(s):",
                              choices = c("John", "Paul", "George", "Ringo"),
                              selected = "John")
           ),
    mainPanel(plotOutput("lineplot"))
  )
)

# server logic
server8 <- function(input, output){
  
  output$lineplot <- renderPlot({
    
    ggplot(data = beatles %>% filter(year >= input$startyear, year <= input$endyear,
                                     name %in% input$names)) +
      geom_line(aes(x = year, y = popularity, color = name), size = 2)
    
  })
}

# run the application 
shinyApp(ui = ui8, server = server8)

