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
    fit <- kmeans_cluster(iris, input$xvar, input$yvar, input$k)
    plot_clusters(iris, input$xvar, input$yvar, fit)
  })

  output$centersTable <- renderTable({
    fit <- kmeans_cluster(iris, input$xvar, input$yvar, input$k)
    as.data.frame(fit$centers)
  }, rownames = TRUE)

}

shinyApp(ui = ui, server = server)
