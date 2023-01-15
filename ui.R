
library(shiny); library(DT)
library(htmltools); library(htmlwidgets);library(httr)   



navbarPage(
  title = 'Benvenuti',
  
  
  tabPanel(title = "Data",  icon = icon("database"), br(),
           
           h5("The sample data of NYC13FLIGHTS."), 
           tags$a( "Plese find more about in the following link", 
                   href="https://cloud.r-project.org/web/packages/nycflights13/index.html"), br(),
           
           HTML("Filter The Data Table Below, then click"),

           downloadButton(outputId = "download_filtered",
                          label = "Download Filtered Data"), br(),
           
           DT::dataTableOutput("dt")),
  

  #tabPanel("About",tags$br()), 
  
  #id for navbarPage           
  id = "navbar" )


















