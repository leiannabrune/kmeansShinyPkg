library(shiny)

ui <- fluidPage()

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "num",
    label = "Choose a number",
    value = 25,
    min = 1,
    max = 100
  )
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "num",
    label = "Choose a number",
    value = 25,
    min = 1,
    max = 100
  ),
  plotOutput("hist")
)

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "num",
    label = "Choose a number",
    value = 25,
    min = 1,
    max = 100
  ),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num))
  })
}

shinyApp(ui = ui, server = server)

library(shiny)

ui <- fluidPage(
  sliderInput(
    inputId = "k",
    label = "Number of clusters (k):",
    value = 3,
    min = 1,
    max = 9
  ),
  plotOutput("clusterPlot")
)

server <- function(input, output) {
  output$clusterPlot <- renderPlot({
    x <- iris[, 1:2]                 # numeric data
    fit <- kmeans(x, centers = input$k)
    plot(x, col = fit$cluster, pch = 19)
    points(fit$centers, pch = 8, cex = 2)
  })
}

shinyApp(ui = ui, server = server)

library(shiny)

ui <- fluidPage(
  selectInput("xvar", "X variable:", choices = names(iris)[1:4], selected = "Sepal.Length"),
  selectInput("yvar", "Y variable:", choices = names(iris)[1:4], selected = "Sepal.Width"),
  sliderInput("k", "Number of clusters (k):", value = 3, min = 1, max = 9),
  plotOutput("clusterPlot")
)

server <- function(input, output) {
  output$clusterPlot <- renderPlot({
    x <- iris[, c(input$xvar, input$yvar)]
    fit <- kmeans(x, centers = input$k)
    
    plot(x, col = fit$cluster, pch = 19,
         xlab = input$xvar, ylab = input$yvar)
    points(fit$centers, pch = 8, cex = 2)
  })
}

shinyApp(ui = ui, server = server)


library(shiny)

ui <- fluidPage(
  selectInput("xvar", "X variable:", choices = names(iris)[1:4], selected = "Sepal.Length"),
  selectInput("yvar", "Y variable:", choices = names(iris)[1:4], selected = "Sepal.Width"),
  sliderInput("k", "Number of clusters (k):", value = 3, min = 1, max = 9),
  
  plotOutput("clusterPlot"),
  tableOutput("centersTable")
)

server <- function(input, output) {
  
  output$clusterPlot <- renderPlot({
    x <- iris[, c(input$xvar, input$yvar)]
    fit <- kmeans(x, centers = input$k)
    
    plot(x, col = fit$cluster, pch = 19,
         xlab = input$xvar, ylab = input$yvar)
    points(fit$centers, pch = 8, cex = 2)
  })
  
  output$centersTable <- renderTable({
    x <- iris[, c(input$xvar, input$yvar)]
    fit <- kmeans(x, centers = input$k)
    
    as.data.frame(fit$centers)
  }, rownames = TRUE)
  
}

shinyApp(ui = ui, server = server)
