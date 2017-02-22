library(shiny)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(tabsetPanel(

  # page 1- map plotout page
  tabPanel("Discussion",
    sidebarLayout(
        sidebarPanel(
        # selectbox to choose the borough
        selectInput("borough", label = "Choose a Borough", 
                           choices = list("Manhattan", "Bronx", 
                                          "Queens", "Brooklyn",
                                          "Staten Island"="Staten_Island"
                                          ),
                           selected = 0),
        
        # selectbox to choose the neighborhood based on the borough
        uiOutput("neighborhood"),
        
        # selectInput("time", label="Choose Time",
        #             choices = list("111"=1,
        #                            "222"=2,
        #                            "333"=3),
        #             selected = 1),
        
        checkboxGroupInput("mapstyle", label = "View Maps",
                           choices = list("Heat map"=1,
                                          "Google map"=2))
      ),
      # the main panel of page 1
      mainPanel(
        # main title
        h1("Wifi Spots/Heat Map throughout New York City"),
        plotOutput("map")
      ))),
  
  #Page 2 - Result Tab
  tabPanel("Results - Business Owner Side",
      sidebarLayout(
        sidebarPanel(
          selectInput("Places to Open Stores", "For Small Business Owners...",
                      choices=c("Ideal Place to Open a Store"=1,
                                   "Re-consider the Location Plz"=2,
                                   "Maybe a Good Place to Open a Store"=3))),
         mainPanel(
          h1("Where should Small Business Owners to Open a Store?")
          #textOutput("text")
          #plotOutput("map")
        )
       
      )
  ),
    
  
  #Page 3 - Result Tab
  tabPanel("Results - Customer Side",
           sidebarLayout(
             sidebarPanel(
               selectInput("Places to go for Wi-Fi", "For Customers...",
                           choices=c("Ideal Store for Wi-Fi"=1,
                                     "Never Go"=2,
                                     "Maybe OK to Go"=3))),
             mainPanel(
               h1("Where should we go when need Wi-Fi connections")
               #textOutput("text") - 
               #plotOutput("map")
             )
             
           )
  )
  
)



))

