# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyServer(function(input, output ) {

  output$agePlot <- renderPlot({
     ggplot(data = (clean_age %>% filter(Year==input$ageYear)), aes(x =AgeBracket, y=Count)) +
      geom_bar(aes(fill = Sex), stat="identity", position = "dodge") +
      theme(panel.border = element_blank()) +
      theme(panel.background = element_blank())
  })
  
  # State
  output$statePlot <- renderPlot({
    datatoplot <- states %>% filter(., Year==input$stateYear)
    fillColor = datatoplot[,input$consumptionfreq]
    gg <- ggplot()
    gg <- gg + geom_map(data=us, map=us, 
                        aes(x=long, y=lat, map_id=region),
                        fill="#ffffff", color="#ffffff", size=0.15)
    gg <- gg + geom_map(data=datatoplot, map=us,
                        aes(fill=fillColor, map_id=tolower(State)),
                        color="#ffffff", size=0.15)
    gg <- gg + scale_fill_continuous(low='#fcd4d4', high='#ff3a3a',
                                     guide='colorbar')
    gg <- gg + labs(x=NULL, y=NULL)
    gg <- gg + coord_map("albers", lat0 = 39, lat1 = 45)
    gg <- gg + theme(panel.border = element_blank())
    gg <- gg + theme(panel.background = element_blank())
    gg <- gg + theme(axis.ticks = element_blank())
    gg <- gg + theme(axis.text = element_blank())
    gg
  })
  
  #boxplots
  output$productPlot <- renderPlot({
    test1=survey[,input$metricselection]
    testy=survey[,input$metricselection]
    productmetricplot <- ggplot(data = survey, 
                                aes(x=reorder(Tobacco.Product, test1, median), 
                                    y= testy), stat='identity') 
    
    
    productmetricplot + geom_boxplot(outlier.color = "red", outlier.shape = 4, outlier.size = 3) + 
      ylab("Units") + xlab("Tobacco products") +
     theme(panel.border = element_blank()) +
     theme(panel.background = element_blank())

  })
  
  fill = c("red", "steelblue")
  dataforbucketplot = reactive(clean_age %>% filter(., AgeBracket==input$TSagePlot))
  output$bucketplot = renderPlot({
    ggplot(dataforbucketplot(), aes(x = Year, y = Count, size = Count, fill=Sex)) +
        geom_point(shape =21 )+scale_fill_manual(values = fill) +
        scale_size(range = c(1, 10))
    
  })
  
})

