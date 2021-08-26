#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    library(caret)
    
    partition <- createDataPartition(y=iris$Species, 
                                p=0.7, 
                                list=FALSE)
    train <- iris[partition,]
    test <- iris[-partition,]
    
    dtree = train(Species ~ .,  
                  data=train, 
                  method="rpart", 
                  trControl = trainControl(method = "cv"))
   
    output$tree <- renderPlot ({
        library(rattle)
        fancyRpartPlot(dtree$finalModel, uniform=TRUE, main="Classification Tree")
        
        })

    testpred <-  predict(dtree, newdata = test)
    error  <- round(mean(testpred != test$Species), 2)
    
    output$error <- renderText({ error 
        
    })
     
    
    species <- reactive({
        sl <- input$sl
        sw <- input$sw
        pl <- input$pl
        pw <- input$pw
        predict(dtree, newdata=data.frame(Sepal.Length=sl, Sepal.Width=sw, Petal.Length=pl, Petal.Width=pw) )
        
        
    })
    
    
    output$species <- renderText({species()
        }) 
})
