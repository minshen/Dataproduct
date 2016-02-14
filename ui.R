# Coursera - Developing Data Products- Course Project
# ui.R file for the shiny app
# This app was developed to help people choose the best car for their trip, using mtcars dataset, from [R] 

library(markdown)

shinyUI(navbarPage("Select the best car for your trip",
        tabPanel("Table",
                   
        # Sidebar
        sidebarLayout(
            sidebarPanel(
                helpText("Provide information about your trip and the characteristic of the car that you want"),
                numericInput('dis', 'Distance (in miles):', 100, min = 1, max = 1000),
                numericInput('cost', 'Gasoline Price (per gallon):', 2.00, min = 2, max = 4, step=0.01),
                numericInput('gas', 'Maximum expenditure on gasoline:', 100, min=1, max=1000),
                checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8)),
                sliderInput('disp', 'Displacement', min=60, max=460, value=c(60,460), step=10),
                sliderInput('hp', 'Gross horsepower', min=40, max=330, value=c(40,330), step=10),
                checkboxGroupInput('am', 'Transmission:', c("Automatic"=0, "Manual"=1), selected = c(0,1))
            ),
            
            
            mainPanel(
               dataTableOutput('table')
            )
        )
),
        tabPanel("About",
            mainPanel(
                includeMarkdown("about.md")
            )
        )
    )
)   