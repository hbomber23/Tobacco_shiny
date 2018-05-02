#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

shinyUI(dashboardPage(
  dashboardHeader(title= "Tobacco Consumption"),
  dashboardSidebar(
    sidebarUserPanel("", subtitle=""),
    sidebarMenu(
      menuItem("Statewide Comparison", tabName = "map", icon=icon("map")),
      menuItem("Age and gender breakouts", tabName = "age", icon=icon("map")),
      menuItem("Tobacco Products", tabName = "product", icon=icon("map"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "map", 
              fluidRow(sliderInput(inputId ="stateYear", 
                                   label = "Consumption years", min= 1996, 
                                   max=2010, value =1996, sep=""), align="center"),
              fluidRow(selectizeInput(inputId = "consumptionfreq",
                                      label = "Consumption groups",
                                      choices = smokechoicefreq), align="center"),
              fluidRow(plotOutput("statePlot", width="100%", height=475))
      ),
      
      tabItem(tabName = "age",
              
              fluidRow(selectizeInput(inputId= "TSagePlot", 
                                      label="time series year",
                                      choices =ts_age), align="center"),
              
              #fluidRow(sliderInput(inputId= "TSagePlot", 
              #                     label="time series year", min =2000,
              #                     max=2010, value= 2000, sep=""), align="center"),
              fluidRow(plotOutput("bucketplot", width="100%", height=400)),
              
              fluidRow(selectizeInput(inputId = "ageYear",
                                      label = "Year selection",
                                      choices = yearchoice), align="center"),
              fluidRow(plotOutput("agePlot", width="100%", height=400))
              
              
      ),
      
      
      
      
      tabItem(tabName = "product",
              fluidRow(selectizeInput(inputId = "metricselection",
                                      label = "Metrics comparison",
                                      choices = metricchoice), align="center"),
              fluidRow(plotOutput("productPlot", width="100%", height=400)))
      
    ))
))

