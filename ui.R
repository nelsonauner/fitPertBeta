setwd("C:/Users/n_auner/tech/PERT-shiny")
library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  # Application title
  titlePanel("Fit a shifted beta density by mode and two quartiles"),
  h6("designed by TGG Group"),
  # Sidebar with controls to provide a caption, select a dataset, and 
  # specify the number of observations to view. Note that changes made
  # to the caption in the textInput control are updated in the output
  # area immediately as you type  sidebarPanel(
  fluidRow(
    column(2,
  wellPanel(
    #sliderInput("target",
    #            "% of High Value Players to Target", 
     #           min=.01,
      #          max=.8,
       #         value=.2),
    numericInput("mode", "mode of distribution", 25),
    numericInput("q_upper", "Upper percentile", .95),
    numericInput("q_lower", "Lower Percentile", .05),
    numericInput("val_lower", "Value", 0),
    numericInput("val_upper", "Higher value", 50),
	numericInput("shape_param", "The bigger, the spikier", 4)
	
  )),

  # Show the caption, a summary of the dataset and an HTML table with
  # the requested number of observations
  column(10,
  #wellPanel(
    h3(textOutput("caption")), 
    plotOutput("catchPlot")
    # h3("Analytical Results:"),
    # tableOutput("view")
  
  ) )
) )