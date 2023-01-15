
#https://datascience-enthusiast.com/R/shiny_ML.html
#https://github.com/ismyrnow/leaflet-groupedlayercontrol

data_table <- as.data.frame(read.csv("nycflights13.lon.lat.csv",sep = ",", header = TRUE))

data_table <- data_table[1:1000,]

function(input, output) {
  


  output$dt <- 
    DT::renderDataTable(
      datatable(data_table,
                filter = "top"),
      server = FALSE
    )
  
  output$filtered_row <- 
    renderPrint({
      input[["dt_rows_all"]]
    })
  
  
  output$download_filtered <- 
    downloadHandler(
      #filename = "Filtered Data.csv",
      filename = function() {
        paste('filtered data-', Sys.Date(), '.csv', sep = '')
      },
      content = function(file){
        write.csv(data_table[input[["dt_rows_all"]], ],
                  file)
      }
    )
}
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  