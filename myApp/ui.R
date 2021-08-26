#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

# This app was created as a final project for the Data Science Products Course
# as part of Data Science Specialization Course at Coursera. 

# This shiny app can be used to predict the XXX. The algorithm used for prediction was a simple
# decision tree.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predicting the plant species using Machine Learning"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            numericInput("pl",
                        "What is the Petal Lenght?",
                        min = 0,
                        max = 20,
                        value = 1.4),
            numericInput("pw",
                         "What is the Petal Width?",
                         min = 0,
                         max = 1000,
                         value = 0.2),
            numericInput("sl",
                         "What is the Sepal Lenght?",
                         min = 0,
                         max = 1000,
                         value = 5.1),
            numericInput("sw",
                         "What is the Sepal Width?",
                         min = 0,
                         max = 1000,
                         value = 3.5),
        ),

        # Show the result of the algorithm (was is the plant) and the decision tree generated
        mainPanel(
            plotOutput('tree'),
            h2('Your plant belongs to:'),
            textOutput('species'),
            h5('For setosa=1, versicolor=2, virginica=3'),
            h3('Estimated error rate for this prediction:'),
            textOutput('error')
        )
    )
))
