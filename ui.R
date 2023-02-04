
library(shiny); library(DT)
library(htmltools); library(htmlwidgets);library(httr)   



navbarPage(
  title = 'Benvenuti',
  
  
  tabPanel(title = "Data",  icon = icon("database"), br(),
           
           h5("I metadati di NYC13FLIGHTS."), 
           tags$a( "Si prega di trovare ulteriori informazioni a seguente link", 
                   href="https://cloud.r-project.org/web/packages/nycflights13/index.html"), br(),
           
           HTML("Filtrare la tabella dei dati di seguito, e poi fare clic su"),

           downloadButton(outputId = "download_filtered",
                          label = "Scarica Dati Filtrati"), br(),
           
           DT::dataTableOutput("dt")),
  

  #tabPanel("About",tags$br()), 
  
  #id for navbarPage           
  id = "navbar" )


















