library(shiny)
library(datasets)
library(BB)
library('rriskDistributions')
source("fitPertBeta.R")
# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
  
  # By declaring datasetInput as a reactive expression we ensure that:
  #
  #  1) It is only called when the inputs it depends on changes
  #  2) The computation and result are shared by all the callers (it 
  #     only executes a single time)
  #
  #   datasetInput <- reactive({
  #     switch(input$dataset,
  #            "rock" = rock,
  #            "pressure" = pressure,
  #            "cars" = cars)
  #   })
  # The output$summary depends on the datasetInput reactive expression, 
  # so will be re-executed whenever datasetInput is invalidated
  # (i.e. whenever the input$dataset changes)
  # The output$view depends on both the databaseInput reactive expression
  # and input$obs, so will be re-executed whenever input$dataset or 
  # input$obs is changed. 
  
  
  
  
anal <- reactive({
  #target_tool(in_sample, input$target, input$cost, input$value)})
  fitPertBeta()#input$q_lower,input$q_upper,input$val_lower,input$val_upper,mode,shape_param)
  })
  
  output$catchPlot <- renderPlot({
	anal <- anal()$par
    (min <- anal[1])
	(max <- anal[2])
	xvals <- seq(from=min-5,to=max+5,by=.1)
	plot(x=xvals,y=dpert(xvals,min=min,input$mode,max=max,shape=input$shape_param),
	type="l",
	xlab="value",
	ylab="density",
	main="The result of too much time spent",
	)
  },height=400,width=600)
  #output$view <- renderTable({
    #anal() 
})